#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>


#define WINDOW_SIZE 12 // in bytes
#define ALIGNED_SIZE (WINDOW_SIZE + 7) / 8 * 8



// There are 236990859 indices, so index "0 + 236990858 others"
#define NUMBER_OF_Ns 236990858
#define MAX_COUNT 2047

// Entry in hash table
typedef struct {
    unsigned int index;
    unsigned int size;
} bucket;


// Entry in MPH table
typedef struct {
    unsigned int index;        		// index in genome
    unsigned int size : 11;   		// The "+ X others" value (if == 2047, replace with 236990858)
    int offset : 1;                 // bit indicating whether the ivalue is an offset, or a new seed for the hash function
    int ivalue : 20;             	// either the new seed OR an offset from the current location; current location = h(key, seed = 0)
} tinybucket;


// inline for performance
// gets a 100 bp (25 bytes) read from a genome at a given index
// (you may alter the number of bytes by setting WINDOW_SIZE above)
void getWindowAtIndex2(unsigned char *genome, unsigned char *window, unsigned long index, unsigned window_size) {

	if (index % 4 != 0)	{
		unsigned char temp[window_size + 1];
		memcpy(temp, &genome[index / 4], window_size + 1);

		unsigned char shift = 2 * (index % 4);
		unsigned int i;

		for (i = 0; i < window_size; i++) {
			temp[i] = (temp[i] >> shift) | (temp[i+1] << (8 - shift));
		}

		memcpy(window, temp, window_size);

	} else {
		memcpy(window, &genome[index / 4], window_size);
	}
}

void getWindowAtIndex(unsigned char *genome, unsigned char *window, unsigned long index) {
	getWindowAtIndex2(genome, window, index, WINDOW_SIZE);
}



typedef unsigned long long 	uint64;
typedef unsigned int 		uint32;

// Rotate left (this should compile into a single instruction)
#define Rot64(x, k) ((x << k) | (x >> (64 - k)))


#define ShortMix(h0, h1, h2, h3) 		\
{										\
    h2 = Rot64(h2,50) + h3;  h0 ^= h2;	\
    h3 = Rot64(h3,52) + h0;  h1 ^= h3;	\
    h0 = Rot64(h0,30) + h1;  h2 ^= h0;	\
    h1 = Rot64(h1,41) + h2;  h3 ^= h1;	\
    									\
    h2 = Rot64(h2,54) + h3;  h0 ^= h2;	\
    h3 = Rot64(h3,48) + h0;  h1 ^= h3;	\
    h0 = Rot64(h0,38) + h1;  h2 ^= h0;	\
    h1 = Rot64(h1,37) + h2;  h3 ^= h1;	\
    									\
    h2 = Rot64(h2,62) + h3;  h0 ^= h2;	\
    h3 = Rot64(h3,34) + h0;  h1 ^= h3;	\
    h0 = Rot64(h0,5)  + h1;  h2 ^= h0;	\
    h1 = Rot64(h1,36) + h2;  h3 ^= h1;	\
}										

#define ShortEnd(h0, h1, h2, h3) 				\
{												\
    h3 ^= h2;  h2 = Rot64(h2,15);  h3 += h2;	\
    h0 ^= h3;  h3 = Rot64(h3,52);  h0 += h3;	\
    h1 ^= h0;  h0 = Rot64(h0,26);  h1 += h0;	\
    h2 ^= h1;  h1 = Rot64(h1,51);  h2 += h1;	\
    											\
    h3 ^= h2;  h2 = Rot64(h2,28);  h3 += h2;	\
    h0 ^= h3;  h3 = Rot64(h3,9);   h0 += h3;	\
    h1 ^= h0;  h0 = Rot64(h0,47);  h1 += h0;	\
    h2 ^= h1;  h1 = Rot64(h1,54);  h2 += h1;	\
    											\
    h3 ^= h2;  h2 = Rot64(h2,32);  h3 += h2;	\
    h0 ^= h3;  h3 = Rot64(h3,25);  h0 += h3;	\
    h1 ^= h0;  h0 = Rot64(h0,63);  h1 += h0;	\
}



// Takes a 200 bit message, and a 20 bit seed, and produces a 64 bit hash
// ;range = # hash table entries
// ;bitlength = # of bits needed to represent range
unsigned int hash2(unsigned char *message, unsigned int seed, unsigned int range, uint64 mask, unsigned length) {
    uint64 h0 = seed;
    uint64 h1 = seed;
    uint64 h2 = 0xdeadbeefdeadbeefLL;
    uint64 h3 = 0xdeadbeefdeadbeefLL;
	size_t remainder = length % 32;

    if (length > 15)
    {
        const unsigned char *end = message + (length/32)*4;
        
        // handle all complete sets of 32 bytes
        for (; message < end; message += 32)
        {
			h2 += *((uint64 *) &message[0]);
		    h3 += *((uint64 *) &message[8]);
            ShortMix(h0, h1, h2, h3);
            h0 += *((uint64 *) &message[16]);
            h1 += *((uint64 *) &message[24]);
        }
        
        //Handle the case of 16+ remaining bytes.
        if (remainder >= 16)
        {
			h2 += *((uint64 *) &message[0]);
		    h3 += *((uint64 *) &message[8]);
            ShortMix(h0, h1, h2, h3);
            message += 16;
            remainder -= 16;
        }
    }
    
    // Handle the last 0..15 bytes, and its length
    h3 = ((uint64) length) << 56;

    
    // Handle the last 9 bytes
    /////////////////////////////
    switch (remainder)
    {
		case 15:
			h3 += ((uint64) message[14]) << 48;
		case 14:
			h3 += ((uint64) message[13]) << 40;
		case 13:
			h3 += ((uint64) message[12]) << 32;
		case 12:
			h3 += *((uint32 *) &message[8]);
			h2 += *((uint64 *) &message[0]);
			break;
		case 11:
			h3 += ((uint64) message[10]) << 16;
		case 10:
			h3 += ((uint64) message[9]) << 8;
		case 9:
			h3 += (uint64) message[8];
		case 8:
			h2 += *((uint64 *) &message[0]);
			break;
		case 7:
			h2 += ((uint64) message[6]) << 48;
		case 6:
			h2 += ((uint64) message[5]) << 40;
		case 5:
			h2 += ((uint64) message[4]) << 32;
		case 4:
			h2 += *((uint32 *) &message[0]);
			break;
		case 3:
			h2 += ((uint64) message[2]) << 16;
		case 2:
			h2 += ((uint64) message[1]) << 8;
		case 1:
			h2 += (uint64) message[0];
			break;
		case 0:
			h2 += 0xdeadbeefdeadbeefLL;
			h3 += 0xdeadbeefdeadbeefLL;
    }

    ShortEnd(h0, h1, h2, h3);

    // h0 and h1 contain the 128-bit hash
    return h0 % range; 

}

unsigned int hash(unsigned char *message, unsigned int seed, unsigned int range, uint64 mask) {
	return hash2(message, seed, range, mask, WINDOW_SIZE);
}



void printWindow(char *bases) {
    static char base[] = {'A', 'C', 'G', 'T'};
    int i;

    for (i = 0 ; i != WINDOW_SIZE; i++) {
        char c = bases[i];
        printf("%c%c%c%c", base[c&0x3], base[(c >> 2) & 0x3], base[(c >> 4) & 0x3], base[(c >> 6) & 0x3]);
    }
    printf("\n");
}



// Memory maps a file, returns a unsigned char * pointing to the file.  
// size should be the address of a long; the function will update it to the 
// size of the file in bytes
unsigned char * memoryMap(const char *filename, unsigned long *size) {
	int fd = open(filename, O_RDONLY);

	if (fd < 0) {
	    perror("Error: Invalid filename.\n");
		exit(1);
	}

	struct stat fileStat;

	if(fstat(fd, &fileStat) < 0) {
		perror("Error: Couldn't get file size.\n");
        exit(1);
	}

	*size = fileStat.st_size;
 	unsigned char * genome = mmap(NULL, *size, PROT_READ, MAP_SHARED, fd, 0);

    if (genome == MAP_FAILED) {
    	perror("Error: Could not map genome.\n");
    	exit(1);
	}
}


// Memory maps a new file, returns a unsigned char * pointing to the file.  
// size should be desired size of the filein bytes
unsigned char * memoryMapAlloc(const char *filename, unsigned long size) {
	int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, (mode_t) 0600);

	if (fd < 0) {
	    perror("Error: Invalid filename.\n");
		exit(1);
	}

    // Seek to last byte and write a zero
    if (lseek(fd, size-1, SEEK_SET) == -1) {
        close(fd);
        perror("Error: Using lseek() to 'stretch' the file failed.\n");
        exit(1);
    }
    if (write(fd, "", 1) != 1) {
        close(fd);
        perror("Error: Could not write last byte of the file.\n");
        exit(EXIT_FAILURE);
    }
    
    // Map file
 	unsigned char *myfile = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

    if (myfile == MAP_FAILED) {
    	perror("Error: Could not mmap file.\n");
    	exit(1);
	}
}

