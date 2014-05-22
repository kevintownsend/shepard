#include "common.h"

// Usage:
// ./getWindow ./genome.bin 384203 -b > read384203.bin
// ./getWindow ./sequence.bin 384203 -r
// ./getWindow ./genome.bin 384203
//
// outputs 100 bp at a given index
// ; genome.bin is the human genome
// ; 30203 - base pair index in genome
// ; -r (optional) - gets a read
// ; -b (optional) - any argument will cause the output to be in binary

int main(int argc, const char *argv[]) {
	
  	if (argc < 3) {
		fprintf(stderr, "Error: Invalid number of arguments.\n Try: ./getWindow ./genome.bin 384203\n");
		return 1;
	}
	
	unsigned long index = atoi(argv[2]);
	if (argc == 4 && strcmp(argv[3], "-r") == 0) {
	    index *= ALIGNED_SIZE * 4;
	}
	
  	long page_size = sysconf(_SC_PAGE_SIZE);
  	const char *filename = argv[1];
	int fd = open(filename, O_RDONLY);

	if (fd < 0) {
	    fprintf(stderr, "Error: Invalid filename.\n");
		return 1;
	}

	struct stat fileStat;

	if(fstat(fd, &fileStat) < 0) {
		fprintf(stderr, "Error: Couldn't get file size.\n");
        return 1;
	}

	unsigned int size = fileStat.st_size;
 	unsigned char * genome = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);

  	if (genome == MAP_FAILED) {
    	fprintf(stderr, "Error: Could not map genome.\n");
    	return 1;
	}

	unsigned char window[ALIGNED_SIZE] = {};
	getWindowAtIndex(genome, window, index);

	if (argc == 4 && strcmp(argv[3], "-b") == 0)
		fwrite(window, 1, ALIGNED_SIZE, stdout);
	else
    	printWindow(window);
		
}
