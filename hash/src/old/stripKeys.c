#include "common.h"
#include <signal.h>

// Usage:
// ./splitKeys ./unique.bin ./output.uniquekeys.bin

// MAIN
int main(int argc, const char *argv[]) {
 
  	if (argc < 2) {
		perror("Error: Invalid number of arguments.\nTry: ./splitKeys ./unique.bin ./output.uniquekeys.bin\n");
		exit(1);
	}

    FILE *unique_fp = fopen(argv[1], "rb");
    FILE *output_fp = fopen(argv[2], "wb");
    
    if (unique_fp == NULL || output_fp == NULL) {
	    perror("Error: Invalid filename(s).\n");
	    exit(1);
    }
    
    bucket b;
	
	printf("Starting...");
    while (fread(&b, sizeof(bucket), 1, unique_fp)) {
        unsigned int i = b.index;
	    fwrite(&i, 1, sizeof(unsigned int), output_fp);
    }
    
    fclose(unique_fp);    
    fclose(output_fp);
    printf("Done!\n");
}
