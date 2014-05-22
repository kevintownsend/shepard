#include "common.h"

#define MAX_HASH_TABLE_SIZE 4000000000ULL

#define SCRATCH_DIR "/dev/shm/"



// Usage:
// ./countUnique.exe ./genome.bin ./unique.bin
//
// outputs the number of unique 100 k-mers in the genome
// ; genome.bin is the human genome
// ; unique.bin is the output file that will contain unique indices / count pairs (buckets)


// Questions this program answers:
// How many unique 100 bp words are there in the genome?
// How many duplicate 100 bp words are there?
// Can I have a list of all unique words, with the index of first occurrence and a count of the number of occurences?


// Overview of Algorithm:
// The algorithm sweeps the entire genome initially, and stores new unique entries (buckets) into a hash table.
// For those reads that hash to the same index as a previous read (collision), it is either because 
// a) it's a duplicate; increment the count
// b) it's a collision; two different reads that hash to the same index; store this collision for processing later in a temp file
// 
// On the first sweep, probability suggests roughly 2/3rds of the genome will fit in a bucket, while the other 1/3rd 
// will be collisions.  Thus, the algorithm loops, first processing the entire genome, then processing the 1/3rd of the
// genome that collided, etc.  The expected runtime is therefore a geometric sum = O(1.5 n)
//
// A max hash table size (#define) was added to allow the program to run using < 2 GB of memory.  Thus, for large genome's
// it will process the entire genome, but only be able to find 250 million unique entries at a time.  This slows the algo and changes its
// runtime, but still allows the algo to complete in ~4 hours to process the entire genome.


// Stats variables
unsigned int unique = 0, duplicate = 0, collision = 0, max_bucket_size = 0, unique_duplicate = 0;


// Main algorithm; processes a collision temp file
// Collision temp files contain a binary array of ints that indicate the index in the genome of a read that was a collision
unsigned int processCollisionFile(char *readset, char *writecollisions, unsigned char *genome, FILE *unique_fp) {

    FILE *collision_fp = fopen(writecollisions, "wb");
    FILE *reads_fp = fopen(readset, "rb");
    
    if (collision_fp == NULL || reads_fp == NULL) {
        perror("Error: Unable to create temp files.\n");
		exit(1);
    }

    fseek(reads_fp, 0L, SEEK_END);
    unsigned int number_of_reads = ftell(reads_fp) / sizeof(int);
    fseek(reads_fp, 0L, SEEK_SET);
    
    if (number_of_reads > MAX_HASH_TABLE_SIZE) {
        number_of_reads = MAX_HASH_TABLE_SIZE;
        printf("Warning: Limiting hash table size.\n");
    }

	unsigned char bitlength = 0;
    while ((1LL << bitlength) < number_of_reads) bitlength++;
	uint64 mask = 0xFFFFFFFFFFFFFFFFLL;
	mask = mask >> (57 - bitlength);

    static unsigned int seed = 0x39253203;
    seed ^= 0x09381495;
	unsigned char window[WINDOW_SIZE];
    unsigned char check[WINDOW_SIZE];
    unsigned int index;
    unsigned int i = 0;
    collision = 0;

    // Allocate room for the hash table
    unsigned long hashTableSize = number_of_reads * sizeof(bucket);   
    printf("Initializing hash table of size %lu bytes.\n", hashTableSize);
    bucket *hashTable = (bucket *) malloc(hashTableSize);

    if (hashTable == NULL) {
        perror("Error: Unable to allocate hash table.\n");
		exit(1);
    }
    
    memset(hashTable, 0, hashTableSize);
    printf("Processing %u words in the genome.\n", number_of_reads); // ~45 minutes for the first time through the genome, then repeatedly faster

    while (fread(&index, sizeof(int), 1, reads_fp)) {

    	getWindowAtIndex(genome, window, index);

        unsigned int h = hash(window, seed, number_of_reads, mask);

        if (hashTable[h].size == 0) {
            // new and unique
            hashTable[h].index = index; // note: since the indices are initially in order and stay in order, this is the first index of occurrence
            hashTable[h].size++;
            unique++;
        } else {
            // hash collision OR duplicate
            getWindowAtIndex(genome, check, hashTable[h].index);
            
            if (memcmp(window, check, WINDOW_SIZE) == 0) {
                // duplicate!
				hashTable[h].index = index; // last index of occurrence
				if (hashTable[h].size == 1) {
					unique_duplicate++;

					// turn the previously unique word into a duplicate
					unique--;
					duplicate++;			
				} 
				duplicate++;

                hashTable[h].size++;
                
            } else {
                // collision!
                collision++;
                fwrite(&index, sizeof(index), 1, collision_fp);
            }
        }
    }

    // write indices / counts for unique entries in the hash table
    for (i = 0; i < number_of_reads; i++) {
        if (hashTable[i].size != 0) {
            fwrite(&hashTable[i], 1, sizeof(hashTable[i]), unique_fp);

            // max bucket size that is not all A's (N's)
            if ((hashTable[i].size > max_bucket_size) && (hashTable[i].index != 0)) {
                max_bucket_size = hashTable[i].size;
            }
        }
    }

    free(hashTable);

    fclose(collision_fp);
    fclose(reads_fp);

    return collision;
}



// MAIN
int main(int argc, const char *argv[]) {
	
  	if (argc < 3) {
		perror("Error: Invalid number of arguments.\nTry: ./countUnique.exe ./genome.bin ./unique.bin\n");
		exit(1);
	}

    FILE *unique_fp = fopen(argv[2], "wb");

    if (unique_fp == NULL) {
		perror("Error: Invalid unique filename.\n");
		exit(1);
    }

    // memory map the genome	
    unsigned long size, i;
    unsigned char *genome = memoryMap(argv[1], &size);
    unsigned int number_of_reads = (size << 2) - (WINDOW_SIZE << 2) - 1;
    int collisions = number_of_reads;
    
    // Create or get temp file that has set of indices representing all words in genome
    if (argc == 3) {
        FILE *collision_fp = fopen(SCRATCH_DIR "tempA.txt", "wb");
        for (i = 0; i < number_of_reads; i++) {
            fwrite(&i, 1, sizeof(unsigned int), collision_fp);
        }
        fclose(collision_fp);
    } else {
        collisions = processCollisionFile((char *) argv[3], "tempA.txt", genome, unique_fp);
    }
    
    // Run main algorithm
    while (collisions) {
        collisions = processCollisionFile(SCRATCH_DIR "tempA.txt", SCRATCH_DIR "tempB.txt", genome, unique_fp);
        collisions = processCollisionFile(SCRATCH_DIR "tempB.txt", SCRATCH_DIR "tempA.txt", genome, unique_fp);
    }

    fclose(unique_fp);

    printf("Done!\n");


    printf("%u \t buckets are unique (bucket size = 1)\n", unique);
    printf("%u \t buckets of size > 1 \n", unique_duplicate);
    printf("%u \t max bucket size.\n", max_bucket_size);
    printf("%u \t total buckets \n\n", unique + unique_duplicate);

    printf("%u \t base pairs in a word\n", WINDOW_SIZE << 2);
    printf("%u \t words are unique (occur only once) \n", unique);
    printf("%u \t words are duplicates (occur more than once)\n", duplicate);
    printf("%u \t total words \n", unique + duplicate);
    printf("%u \t words in genome\n", number_of_reads);
}

