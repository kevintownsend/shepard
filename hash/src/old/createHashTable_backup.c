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

#define STORAGE "./" 

unsigned long count = 0;
int max_col = 0, num_col = 0;
char stage = 0;
int max_d = 0;

// used for sorting keys into bins
struct ientry {
	unsigned int index; // index in genome
	unsigned short size; // # of times in genome
	short count; // # of collisions
	struct ientry *next; // next item in bin
};


int compare(const void *x, const void *y) {
	count++;
	return ( (struct ientry *) y )->count  -  ( (struct ientry *) x )->count;
}


void checkStatus(int sig) {
    printf(" : Currently at stage %d : %lu \n", stage, count);
    printf("   : max items in a bucket = %d | # of big buckets = %d | max seed value = %d \n", max_col, num_col, max_d);
	// (void) signal(SIGINT, SIG_DFL); // remove signal
}


// MAIN
int main(int argc, const char *argv[]) {

	// STAGE 0 - Setup
    ///////////////////////////////////////////////////////////////////
	signal(SIGINT, checkStatus);
		 
  	if (argc < 4) {
		perror("Error: Invalid number of arguments.\nTry: ./createHashTable.exe ./human.bin ./unique.bin ./hashtablename.bin\n");
		exit(1);
	}
	
	FILE *output_fp = fopen(argv[3], "wb");
	if (output_fp == NULL) {
		perror("Error: Invalid output filename.\n");
		exit(1);
	}
    
    // memory map the genome	
    unsigned long size;
    unsigned char *genome = memoryMap(argv[1], &size);

    // Open unique.bin
    bucket *unique_fp = (bucket *) memoryMap(argv[2], &size);
    unsigned int number_of_entries = size / sizeof(bucket);
    number_of_entries = number_of_entries;
    printf("There are %u entries.\n", number_of_entries);
	
	// Allocate space for the intermediate table & hash table
	printf("Attempting to allocate tables\n");
	struct ientry *intermediate_table = (struct ientry*) memoryMapAlloc(STORAGE "temp_buckets", number_of_entries * sizeof(struct ientry));
	tinybucket *hash_table =  (tinybucket *) memoryMapAlloc(STORAGE "temp_hashtable", number_of_entries * sizeof(tinybucket));
	if (intermediate_table == NULL || hash_table == NULL) {
		perror("Error: Not enough memory\n");
		exit(1);
	}
	unsigned char bitlength = 0;
    while ((1LL << bitlength) < number_of_entries) bitlength++;
	printf("Allocated tables\n");
    
    printf("Zeroing tables\n");
    memset(intermediate_table, 0, number_of_entries * sizeof(struct ientry));
	memset(hash_table, 0, number_of_entries * sizeof(bucket));
	
	// Loop variables
	unsigned char key[25];
	unsigned char check[25];
	unsigned int h, j;
	struct ientry *tmp;
	
	
	// STAGE 1 - Hash every key into bins (a bin contains all keys that collide)
	/////////////////////////////////////////////////////////////////////////////
	stage = 1;
	printf("Adding to intermediate table\n");
    for (count = 0; count < number_of_entries; count++) {
		struct ientry *new_entry = malloc(sizeof(struct ientry));
		new_entry->index = unique_fp[count].index;
		new_entry->size = unique_fp[count].size;
		if (unique_fp[count].size > 2020) new_entry->size = 2030;
		new_entry->next = NULL;
		
        getWindowAtIndex(genome, key, new_entry->index);
        h = hash(key, 0, number_of_entries, bitlength);
		
		// Add to intermediate table
		if (intermediate_table[h].count == 0) {
			intermediate_table[h] = *new_entry;
			intermediate_table[h].count = 1;
			free(new_entry);
		} else {
			// collision :(
			tmp = &intermediate_table[h];
	    	
	    	while (tmp->next != NULL) {
    	    	tmp = tmp->next;
	    	}
	    	
			tmp->next = new_entry;
			
			if (intermediate_table[h].count == 1) // new collision... keep a stat
				num_col++;
				
			intermediate_table[h].count++;
			
			if (intermediate_table[h].count > max_col) // major collision... keep a stat
				max_col = intermediate_table[h].count;
		}
    }
	printf("Done adding to intermediate table:\n");
	printf("%i buckets had collisions\n", num_col);
	printf("Biggest bucket: %i\n", max_col);
	
	// STAGE 2 - Sort the buckets by size in O(n) time :)
	///////////////////////////////////////////////////////////////////
	stage = 2;
	count = 0;
	printf("Sorting\n");
	qsort(intermediate_table, number_of_entries, sizeof(struct ientry), compare);
    printf("Done sorting... first few entries: ");
    printf("%i, ", intermediate_table[0].count);
    printf("%i, ", intermediate_table[1].count);
    printf("%i\n", intermediate_table[2].count);
	
	
	// STAGE 3 - Process the buckets of size > 1 so that their elements
	// no longer collide
	///////////////////////////////////////////////////////////////////
	stage = 3;
	struct ientry *current;
	int *slots = calloc(max_col, sizeof(int)); // should be small (~8)
	printf("Processing big buckets...\n");
	for (count = 0; count < number_of_entries; count++) {
		current = &intermediate_table[count];
		if (current->count <= 1) break; // buckets of size 1
		
		unsigned int d = 1;
		unsigned int items = 0;
		char opps = 0;
        tmp = current;		

		// Repeatedly try different seed values for the hash function
		// that places the previously colliding buckets into free slots
        do {
            getWindowAtIndex(genome, key, tmp->index);
		    h = hash(key, d, number_of_entries, bitlength);
		    
		    if (max_d < d) 
		        max_d = d;

            // Check for a collision between items of this bucket
            opps = 0;
		    for (j = 0; j < items; j++) {
		        if (slots[j] == h) {
                    opps = 1;
		            break;
		        }
		        opps = 0;
		    }
		    
		    // Check for collisions in the values table
		    if (hash_table[h].size != 0 || opps) {
		        tmp = current;
		        items = 0;
		        d++;
		    } else {
		        slots[items++] = h;
		        tmp = tmp->next;
		    }
		    
        } while (tmp != NULL);
        
		// All items in this bucket hashed to a new open space!
		
		getWindowAtIndex(genome, key, current->index);
        h = hash(key, 0, number_of_entries, bitlength);	
		hash_table[h].ivalue = d;
		tmp = current;
        for (j = 0; j < items; j++) {
            hash_table[slots[j]].index = tmp->index;
            hash_table[slots[j]].size = tmp->size;
            tmp = tmp->next;
        }
	}
	printf("Processed all %lu big buckets; max seed = %i ...\n", count, max_d);
			
	// STAGE 4 - Quickly process the buckets of size = 1 
	///////////////////////////////////////////////////////////////////
	long available_index = 0;
	int max_off = 0;
	int min_off = 0;
	for (; count < number_of_entries; count++) {
	    current = &intermediate_table[count];
		if (current->count == 0) break; // done!
		
		// It's nice, because the sort only moves big bins to the front,
		// the remaining bins are still in order!
		
		// Find lowest available index that is empty
		while (hash_table[available_index].size != 0) {
   		    available_index++;
		}
		
		// Add this bucket to the spot
		hash_table[available_index].index = current->index;
		hash_table[available_index].size = current->size;
		
		// Record in the intermediate table the offset from the original location
        getWindowAtIndex(genome, key, current->index);
        h = hash(key, 0, number_of_entries, bitlength);
        
        int offset = (available_index - h);
        if (max_off < offset) max_off = offset;
        if (min_off > offset) min_off = offset;
        
        if (offset > (1 << 18) || offset < -(1 << 18)) {
            printf("Opps... not enough room allocated for the ivalues!\n");
            exit(1);
        }
        
        hash_table[h].ivalue = offset;
        hash_table[h].offset = 1;
	}
	printf("Min/Max offset: [%i : %i]\n", min_off, max_off);
	
	
	
	// STAGE 5 - Output the hash table and intermediate table
	///////////////////////////////////////////////////////////////////
	stage = 5;
	printf("Time to dump out the table!\n");
	fwrite(hash_table, sizeof(tinybucket), number_of_entries, output_fp);
	fclose(output_fp);
    printf("Created a hash table with %u entries!\n", number_of_entries);
}

