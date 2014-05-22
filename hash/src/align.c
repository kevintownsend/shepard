#include "common.h"
#include <time.h>

// Usage:
// ./align ./human.bin ./reads.bin ./hashtablename.bin
//
// Aligns reads and outputs to stdout the alignment data
// ; human.bin is the binary form of the human genome
// ; reads.bin contains the 100bp reads to align
// ; hashtablename.bin contains the hashtable from createHashTable.exe

// For an explanation of the algorithm (w/ pictures!) goto:
// http://stevehanov.ca/blog/index.php?id=119

// MAIN
int main(int argc, const char *argv[]) {

	// Variables
	unsigned long size;
	unsigned long number_of_reads;
	unsigned int hashtablesize;
	tinybucket *hashtable;
	unsigned char *genome;
	FILE *reads_fp;
	tinybucket *output;
	clock_t start, stop;
	double duration;
	unsigned char bitlength = 0;
	unsigned long aligned = 0;

  	if (argc < 4) {
		perror("Error: Invalid number of arguments.\nTry: ./align ./human.bin ./reads.bin ./hashtablename.bin\n");
		exit(1);
	}
	
	// memory map the genome	
	genome = memoryMap(argv[1], &size);

	// Open reads.bin
	reads_fp = fopen(argv[2], "rb");
	if (reads_fp == NULL) {
		perror("Error: Invalid reads filename.\n");
		exit(1);
	}
	fseek(reads_fp, 0L, SEEK_END);
	number_of_reads = ftell(reads_fp);
	fseek(reads_fp, 0L, SEEK_SET);
	
	// load the hash table (and intermediate table)
	hashtable = (tinybucket *) memoryMap(argv[3], &size);
	hashtablesize = size / sizeof(tinybucket);
	while ((1LL << bitlength) < hashtablesize) bitlength++;
	uint64 mask = 0xFFFFFFFFFFFFFFFFLL;
	mask = mask >> (57 - bitlength);

	// Loop variables
	/*
	unsigned char read[ALIGNED_SIZE]; // only first 25 are used; but reads are aligned to 8-byte boundary
	unsigned char check[WINDOW_SIZE];
	*/
	unsigned char read[32]; // only first 25 are used; but reads are aligned to 8-byte boundary
	unsigned char check[25];

	unsigned int h, index, seed;
	tinybucket value;
	unsigned long count;
	short offset;
	int i;

	start = clock();

	for (count = 0; fread(read, 32, 1, reads_fp); count++) {   
		// Get hash of read (key)
		for (i=12; i<25; i++)
			read[i] = 0;
		h = hash(read, 0, hashtablesize, mask);
		
		// Get hash seed from intermediate hash table
		value = hashtable[h];			
		if (value.offset) {
			index = h + value.ivalue;
		} else {
			index = hash(read, value.ivalue, hashtablesize, mask);
		}
		
		// Get value from hash table
		// printf("hash = %u, ivalue = %x, index = %u \n", h, ivalue, index); // debug
		value = hashtable[index];
		
		// Make sure that the read exists in the genome
		getWindowAtIndex(genome, check, value.index);
		
		if (memcmp(read, check, WINDOW_SIZE) == 0) {
			// Read and genome match
			if (value.size == 0) {
				printf("%lu: %u\n", count, value.index);
			} else if (value.size >= 2020) {
				printf("%lu: %u + 236990858 others\n", count, value.index);
			} else {
				printf("%lu: %u + %u others\n", count, value.index, value.size);
			}

			aligned++;

		} else {
			// Read does not exist in genome
			printf("%lu: -\n", count);
		}

	}

	stop = clock();
	duration = ( double ) ( stop - start ) * 1000 / CLOCKS_PER_SEC;

	fprintf(stderr, "Processed %lu reads.\n", count);
	fprintf(stderr, "Time: %.2lf ms\n", duration);
	
	fprintf(stderr, "Number aligned: %d reads (%.2f %%)\n", aligned, (double) aligned / (double) count);
	
	fclose(reads_fp);
}
