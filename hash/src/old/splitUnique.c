#include "common.h"
#include <signal.h>

// Usage:
// ./splitUnique ./human.bin ./unique.bin ./newfilename
//
// splits unique.bin into 16 parts based on first two base pairs
// ; human.bin is the genome
// ; unique.bin contains unique indices / count pairs (buckets)
// ; ./newfilename[0-15]

// Questions this program answers:
// Is it faster to create 16 hash tables instead of one giant one, given that
// the smaller tables can be constructed using 4GB of memory?

// MAIN
int main(int argc, const char *argv[]) {
 
  	if (argc < 4) {
		perror("Error: Invalid number of arguments.\nTry: ./splitUnique ./human.bin ./unique.bin ./newfilename\n");
		exit(1);
	}

    unsigned long size;
    unsigned char *genome = memoryMap(argv[1], &size);

    FILE *unique_fp = fopen(argv[2], "rb");
    if (unique_fp == NULL) {
	    perror("Error: Invalid filename(s).\n");
	    exit(1);
    }
    
    FILE *outfp[16];
    char filename[250];
    int i;
    for (i = 0; i < 16; i++) {
        sprintf(filename, "%s%i", argv[3], i);
        outfp[i] = fopen(filename, "wb");
        if (outfp[i] == NULL) {
	        perror("Error: Invalid filename(s).\n");
		    exit(1);
        }
    }
    
    char index[2];
	bucket b;
	
	printf("Starting...");
    while (fread(&b, sizeof(bucket), 1, unique_fp)) {
	    if (b.index % 4 != 0) {
            index[0] = genome[b.index / 4];
            index[1] = genome[(b.index / 4) + 1];

    		unsigned char shift = 2 * (b.index % 4);
    		index[0] = (index[0] >> shift) | (index[1] << (8 - shift));
    	} else {
		    index[0] = genome[b.index / 4];
	    }			

	    index[0] = index[0] >> 4;	    
	    index[0] &= 0x0F;

        fwrite(&b, 1, sizeof(bucket), outfp[index[0]]);
    }
    
    fclose(unique_fp);
    for (i = 0; i < 15; i++) {
         fclose(outfp[i]);
    }
    
    printf("Done!\n");
}
