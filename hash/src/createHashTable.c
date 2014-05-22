#include "common.h"
#include <signal.h>

// Usage:
// ./createHashTable ./human.bin ./unique.bin ./hashtablename.bin
//
// Creates a hash table of unique indices in the genome.
// ; human.bin is the binary form of the human genome
// ; unique.bin contains unique indices / count pairs (buckets) (use countUnique.exe to obtain)
// ; hashtablename.bin is the output filename
// Use ctrl+c to check the status of the program

// For every key, we only store a unsigned int, using it to refer to the key from slow storage.  
// The algorithm reads from unique.bin 3 times, but the accesses are always sequential.
// Every key is hashed 3 times.  Those that collide are hashed an additional 2+ times.
// The hash table should be stored entirely in memory.  Little extra memory is needed


// TEMP should be on a drive different from unique.bin to prevent thrashing
// If enough RAM is present, use /dev/shm (a tmpfs that uses memory).  It will need
// to store an unsigned int for every key that collides (~30% of your keys).
#define TEMP "/dev/shm/"

#define getBit(char_arr, pos) ( (char_arr[pos / 8] >> (pos % 8)) & 1 )
#define setBit(char_arr, pos) ( char_arr[pos / 8] |= 1 << (pos % 8) )


// Stat tracking variables
unsigned long count;
unsigned char stage;
unsigned int number_of_entries;
unsigned int max_seed = 0;
unsigned char *genome;
unsigned char *htable;
unsigned char key[WINDOW_SIZE];
uint64 mask;

// Runs when you press ctrl+c
void checkStatus(int sig) {
	printf(" Still alive! Stage %d (count = %ld) %.3f%% Max Seed (%u)\n", stage, count, 100.0 * count / number_of_entries, max_seed);
	// (void) signal(SIGINT, SIG_DFL); // remove signal
}




// Finds a good seed for this bucket; uses (genome / htable / max_seed)
unsigned int processBucket(unsigned int *full_bucket, char bucket_size) {

	unsigned int *slots = calloc(bucket_size, sizeof(int));
	unsigned int seed = 1;
	unsigned int items = 0;
	unsigned int h, j;
	
	// Repeatedly try different seed values for the hash function
	// that places the previously colliding buckets into free slots
	do {
		getWindowAtIndex(genome, key, full_bucket[items]);
		h = hash(key, seed, number_of_entries, mask);

		if (max_seed < seed) {
			max_seed = seed;
		}

		// Check for a collision between items of this bucket
		for (j = 0; j < items; j++) {
			if (slots[j] == h) break;
		}
		
		// Check for collisions in the values table
		if (getBit(htable, h) || j < items) {
			items = 0;
			seed++;
		} else {
			slots[items++] = h;
		}
		
	} while (items < bucket_size);
	
	
	// All items in this bucket hashed to different open spaces in htable!
	for (j = 0; j < items; j++) {
		setBit(htable, slots[j]);
	}
	
	// Record <intermediateIndex, seed> pair
	return seed;
}





// MAIN
int main(int argc, const char *argv[]) {	
	// Stat tracking variables
	unsigned char max_bucket_size;
	unsigned int *num_buckets_of_size;
	signed long min_offset = 0;
	signed long max_offset = 0;
	
	// File and array variables
	unsigned long size;
	tinybucket *itable;
	unsigned int *buckets;
	bucket *unique_indices;
	
	// Loop variables
	unsigned int h;
	unsigned int index;
	signed long offset;

	// STAGE 0 - Setup
	///////////////////////////////////////////////////////////////////
	stage = 0;
	signal(SIGINT, checkStatus);
		 
  	if (argc < 4) {
		perror("Error: Invalid number of arguments.\n" \
			   "Try: ./createHashTable ./human.bin ./unique.bin ./output.hashtable\n");
		exit(1);
	}
	
	FILE *output_fp = fopen(argv[3], "wb");
	if (output_fp == NULL) {
		perror("Error: Invalid output filename.\n");
		exit(1);
	}
	
	// memory map the genome
	genome = memoryMap(argv[1], &size);

	// Open unique.bin
	unique_indices = (bucket *) memoryMap(argv[2], &size);
	number_of_entries = size / sizeof(bucket);
	unsigned char bitlength = 0;
	while ((1LL << bitlength) < number_of_entries) bitlength++;
	mask = 0xFFFFFFFFFFFFFFFFLL;
	mask = mask >> (57 - bitlength);
	printf("There are %u entries. (%u bits of data)\n", number_of_entries, bitlength);

	// Allocate space for the intermediate table
	printf("Attempting to allocate space for table(s)\n");
	itable = calloc(number_of_entries, sizeof(tinybucket));	// calloc allocates and clears
	htable = calloc(number_of_entries / 8 + 1, sizeof(char));  // could compress to a bit array
	if (itable == NULL || htable == NULL) {
		perror("Error: insufficient memory\n");
		exit(1);
	}
	printf("Done allocating\n");
	
	
	
	// STAGE 1 - 1st Pass; hash every key and see which spaces in the hash 
	// table will have collisions
	/////////////////////////////////////////////////////////////////////////
	stage = 1;
	max_bucket_size = 0;
	printf("Starting 1st pass\n");
	for (count = 0; count < number_of_entries; count++) {
		getWindowAtIndex(genome, key, unique_indices[count].index);
		h = hash(key, 0, number_of_entries, mask);
		itable[h].index++;

		if (itable[h].index > max_bucket_size) {
			max_bucket_size = itable[h].index;
		}
	}
	printf("Finished 1st pass.  Max bucket size = %d\n", max_bucket_size);
	
	
	
	// STAGE 2 - Count bucket sizes
	///////////////////////////////////////////////////////////////////
	stage = 2;
	num_buckets_of_size = calloc(max_bucket_size + 1, sizeof(unsigned int));
	for (count = 0; count < number_of_entries; count++) {
		char size = itable[count].index;
		num_buckets_of_size[size]++;
	}
	for (count = 0; count <= max_bucket_size; count++) {
		printf("Size %ld : Count %d\n", count, num_buckets_of_size[count]);
	}
	
	
	
	// STAGE 3 - Sort the keys by bucket size by outputing them to files
	//////////////////////////////////////////////////////////////////////////
	stage = 3;
	unsigned int bucket_size;
	char filename[200];
	FILE **temp_files = malloc(max_bucket_size * sizeof(FILE *));
  	printf("Starting sorting...\n");
   	for (bucket_size = 1; bucket_size <= max_bucket_size; bucket_size++) {
		sprintf(filename, TEMP "buckets%d.bin", bucket_size);
		temp_files[bucket_size - 1] = fopen(filename, "wb");
	}
	
	for (count = 0; count < number_of_entries; count++) {
		index = unique_indices[count].index;
		getWindowAtIndex(genome, key, index);
		h = hash(key, 0, number_of_entries, mask);

		unsigned char size = itable[h].index;
		
		if (size > 1) {
			fwrite(&index, sizeof(unsigned int), 1, temp_files[size - 1]);
		}
	}
	
	for (bucket_size = 1; bucket_size <= max_bucket_size; bucket_size++) {
		fclose(temp_files[bucket_size - 1]);
	}
	printf("Finished sorting...\n");


	
	// STAGE 4 - For each bucket of size = X, update the itable to give an
	// index into the buckets[] array.
	//////////////////////////////////////////////////////////////////////////
	stage = 4;
	printf("Assigning indices for all buckets\n");
	unsigned int *indices = calloc(max_bucket_size + 1, sizeof(unsigned int));
	for (count = 0; count < number_of_entries; count++) {
		register unsigned char size = itable[count].index;
		if (size > 2) {
			itable[count].index = indices[size];
			indices[size] += size;
		} else if (size == 2) {
			itable[count].index = -1; // value indicating empty for size 2 buckets
		} else if (size == 1) {
			itable[count].offset = 1; // set flag
		}
	}	
	
	
	
	// STAGE 5 - Handle the large buckets first (size > 2); reseed
	//////////////////////////////////////////////////////////////////////////
	stage = 5;
	FILE *current_buckets;	
	for (bucket_size = max_bucket_size; bucket_size > 2; bucket_size--) {
		printf("Begin processing buckets of size = %d\n", bucket_size);
		sprintf(filename, TEMP "buckets%d.bin", bucket_size);
		current_buckets = fopen(filename, "rb");
		
		size = bucket_size * num_buckets_of_size[bucket_size] * sizeof(unsigned int);
		printf("Allocate memory for buckets (%lu bytes)\n", size);
		buckets = malloc(size);
		
		// For each key, place into a bucket in the buckets[]
		printf("Processing...\n");
		for (count = 0; fread(&index, sizeof(unsigned int), 1, current_buckets); count++) {
			getWindowAtIndex(genome, key, index);
			h = hash(key, 0, number_of_entries, mask);
			buckets[itable[h].index] = index;
			itable[h].index++;
			
			if (itable[h].index % bucket_size == 0) {
				// Bucket is full of genome indices! Process it
				unsigned int *full_bucket = &buckets[(itable[h].index - bucket_size)];
				
				// Returns a good seed value
				itable[h].ivalue = processBucket(full_bucket, bucket_size);
			}
			
		}
		
		free(buckets);
		fclose(current_buckets);
	}
			
			
			
	// STAGE 6 - Handle buckets of size = 2; reseed
	//////////////////////////////////////////////////////////////////////////
	stage = 6;
	unsigned int full_bucket[2];
	current_buckets = fopen(TEMP "buckets2.bin", "rb");
	printf("Begin processing buckets of size = 2\n");
	for (count = 0; fread(&index, sizeof(unsigned int), 1, current_buckets); count++) {
		getWindowAtIndex(genome, key, index);
		h = hash(key, 0, number_of_entries, mask);

		if (itable[h].index == -1) {
			itable[h].index = index;
		} else {
			// Bucket is full! Process it
			full_bucket[0] = itable[h].index;
			full_bucket[1] = index;
			
			// Returns a good seed value
			itable[h].ivalue = processBucket(full_bucket, 2);
		}
	}
	fclose(current_buckets);
	
	
	
	// STAGE 6 - Handle buckets of size = 1; displace
	//////////////////////////////////////////////////////////////////////////
	stage = 6;
	current_buckets = fopen(TEMP "buckets1.bin", "rb");
	long smallest_index = 0;
	printf("Displace buckets of size = 1\n");
	for (count = 0; count < number_of_entries; count++) {
		if (itable[count].offset != 0) {
			// This is a bin that only had one key fall in it.
		
			// Look for an empty spot in the htable
			while (getBit(htable, smallest_index) != 0) {
   				smallest_index++;
			}
		
			offset = smallest_index - count;
			if (offset > max_offset) max_offset = offset;
			if (offset < min_offset) min_offset = offset;
			itable[count].ivalue = offset;
			setBit(htable, smallest_index);
		}
	}
	fclose(current_buckets);
	printf("Intermediate Table Created (still in memory).  Statistics:\n");
	printf("Offset range: %ld [%ld, %ld]\n", max_offset - min_offset, min_offset, max_offset);
	printf("Largest seed: %u\n", max_seed);
	
	
	
	// STAGE 7 - Add the values to the hash table
	//////////////////////////////////////////////////////////////////////////
	stage = 7;
	printf("Adding genome indices and count values to intermediate table\n");
	for (count = 0; count < number_of_entries; count++) {
		getWindowAtIndex(genome, key, unique_indices[count].index);
		h = hash(key, 0, number_of_entries, mask);

		if (itable[h].offset) {
            h = h + itable[h].ivalue;
        } else {
            h = hash(key, itable[h].ivalue, number_of_entries, mask);
        }

		itable[h].index = unique_indices[count].index;
		itable[h].size = unique_indices[count].size - 1;

		if (unique_indices[count].size > MAX_COUNT) {
			itable[h].size = MAX_COUNT;
		}
	}
	
	
	
	// Stage 8 - Write MPH Table
	//////////////////////////////////////////////////////////////////////////
	stage = 8;
	printf("Dumping table to disk!\n");
	fwrite(itable, number_of_entries, sizeof(tinybucket), output_fp);
	
	
	
	// Stage 9 - Clean up
	//////////////////////////////////////////////////////////////////////////
	stage = 9;
	printf("Done!\n");
	free(itable);
	free(num_buckets_of_size);	
}
