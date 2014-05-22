#include "common.h"
#include <signal.h>

// Usage:
// ./analyzeUnique ./unique.bin
//
// outputs statistical information about the unique 100bp reads
// ; unique.bin is the output file that will contain unique indices / count pairs (buckets)

// Questions this program answers:
// Given a list of all unique words, with the index of first occurrence and a count of the number of occurences (use ./countUnique.exe):
// What 100 base pair words occur most frequently in the genome?
// How many times do this words occur?
// How many unique counts are there?
// What is the max index of all the reads?

unsigned int max_i = 0;
bucket *max;

void printStats() {
    int i;
    printf("Index               Count\n");
    for (i = 0; i < 10; i++) {
        printf("%-20u%-20u\n", max[i].index, max[i].size);        
    }
    
    printf("Max index: %u", max_i);
}


void sigfun(int sig) {
    printf("Quit prematurely...\n");
	(void) signal(SIGINT, SIG_DFL);
	
    printStats();    
    exit(1);
}


// MAIN
int main(int argc, const char *argv[]) {
	
	(void) signal(SIGINT, sigfun);
	 
  	if (argc < 2) {
		perror("Error: Invalid number of arguments.\nTry: ./analyzeUnique ./unique.bin\n");
		exit(1);
	}

    FILE *unique_fp = fopen(argv[1], "rb");

    if (unique_fp == NULL) {
		perror("Error: Invalid unique filename.\n");
		exit(1);
    }
	
    int i;
	bucket b;
	
	char uni[2021] = {0};
	memset(uni, 0, 2021 * sizeof(char));
			
	max = (bucket *) malloc(10 * sizeof(bucket));
	memset(max, 0, 10 * sizeof(bucket));
	
    while (fread(&b, sizeof(bucket), 1, unique_fp)) {
    
        if (b.index > max_i)
            max_i = b.index;
    
        if (b.size < 2020) {
            uni[b.size] = 1;
        }

        if (b.size < max[9].size) continue; // too small, NEXT

        for (i = 9; i > 0; i--) {
            max[i] = max[i-1];
            max[i-1] = b;
            
            if (b.size < max[i-2].size) {
                break;
            }
        }

    }
    
    int uni_count = 1;
    
    for (i = 0; i < 2020; i++) {
        if (uni[i] == 1) {
            uni_count++;
        }
    }
    
    fclose(unique_fp);

    printf("Done!\n");
    
    printf("Unique sizes: %u \n", uni_count);
    
    printStats();
}



