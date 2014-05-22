#include <convey/usr/cny_comp.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <fstream>
#include <ctime>
#include <unistd.h>
#include <sys/time.h>
#include <time.h>

#define SIGNATURE "Shepard"

// Usage:
// ./align ./human.bin ./hashtablename.bin ./reads.bin
//
// Aligns reads and outputs to stdout the alignment data
// ; human.bin is the binary form of the human genome
// ; hashtablename.bin contains the hashtable from createHashTable.exe
// ; reads.bin contains the 100bp reads to align

typedef struct {
	unsigned int index;
	unsigned int others;
} bucket;


#undef DEBUG

using namespace std;

typedef unsigned long long uint64;
extern "C" void cpShepard();


FILE * openFile(const char *filename, uint64 *size) {
	FILE *fp = fopen(filename, "rb");
	if (fp == NULL) {
		fprintf(stderr, "Error: Bad filename: %s\n", filename);
		exit(1);
	}
	fseek(fp, 0L, SEEK_END);
	*size = ftell(fp);
	fseek(fp, 0L, SEEK_SET);
	
	return fp;
}


uint64 copyFileToMemory(FILE *fp, uint64 size) {

    unsigned t0 = clock()/1000;
    unsigned t1, t2, t3;
	void *base_adr = malloc(size);
    void *cp_base_adr = cny_cp_malloc(size);
    if (cp_base_adr == NULL) {
		perror("Error: cny_cp_malloc failed");
		exit(1);
	}
    
	if (base_adr == NULL) {
		perror("Error: malloc failed");
		exit(1);
	}
    t1 = clock()/1000;
	fread(base_adr, 1, size, fp);
	t2 = clock()/1000;
    cny_cp_memcpy(cp_base_adr, base_adr, size);
    t3 = clock()/1000;
    free(base_adr);
	fclose(fp);
	return (uint64) cp_base_adr;
}

timespec diff(timespec start, timespec end)
{
    timespec temp;
    if ((end.tv_nsec-start.tv_nsec)<0) {
        temp.tv_sec = end.tv_sec-start.tv_sec-1;
        temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
    } else {
        temp.tv_sec = end.tv_sec-start.tv_sec;
        temp.tv_nsec = end.tv_nsec-start.tv_nsec;
    }
    return temp;
}


int main(int argc, char *argv[]) {

	clock_t start, stop;
	double duration;
    struct timeval t0, t1, t2;
    long mtime, seconds, useconds;
    timespec time1, time2, time3;
	uint64 size, count;
	FILE *fp;

	uint64 genome;
	uint64 hashtable;
	uint64 reads;
	bucket *output;
    bucket *hostOutput;
    char *hostFormatOutput;
	uint64 read_count;
	uint64 table_size;
	if (argc < 4) {
		perror("Error: Invalid number of arguments.\nTry: ./align ./human.bin ./hashtablename.bin ./reads.bin\n");
		exit(1);
	}

	// Get personality signature
	cny_image_t sig1, sig2;
	int stat;
	cny_get_signature((char *) SIGNATURE, &sig1, &sig2, &stat);
	if (stat) {
		fprintf(stderr, "Error: cny_get_signature() Failure: %d\n", stat);
		exit(1);
	}

	// Put genome in memory
	fp = openFile(argv[1], &size);
	genome = copyFileToMemory(fp, size);

	// Put hashtable in memory
	fp = openFile(argv[2], &size);
	hashtable = copyFileToMemory(fp, size);
	table_size = size / 8;

	// Allocate space for output array
	fp = openFile(argv[3], &size);
	read_count = size / 32;
    cout << "number of reads: " << read_count << endl;
	output = (bucket *) cny_cp_malloc(read_count * 8);
	hostOutput = (bucket *) malloc(read_count * 8);
    hostFormatOutput = (char *)malloc(read_count * 32);
    memset(output, 0xFF, size/4);
	uint64 output_ptr = (uint64) output;
	

	// START CLOCK - Put reads in memory
	start = clock();
	reads = copyFileToMemory(fp, size);

    unsigned copyTime = (clock() - start) * 1000 / CLOCKS_PER_SEC;
	// Make coprocessor call
#define CUTSIZE 2048
	uint64 iterations = read_count / CUTSIZE;
    uint64 leftover = read_count % CUTSIZE;
    cout << "starting coproc call" << endl;
    
    //measure time here
    gettimeofday(&t0,NULL);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);

    //coprocessor call
    //long coprocessor calls cause an issue so it has been split up
    for(int i = 0; i < iterations; i++)
        copcall_fmt(sig1, cpShepard, "AAAAAA", genome, hashtable, (reads + CUTSIZE * 32 * i), (output_ptr + CUTSIZE * 8 * i), table_size, (uint64)CUTSIZE);
    copcall_fmt(sig1, cpShepard, "AAAAAA", genome, hashtable, (reads + CUTSIZE * 32 * iterations), 
        (output_ptr + CUTSIZE * 8 * iterations), table_size, leftover);

    //copcall_fmt(sig1, cpShepard, "AAAAAA", genome, hashtable, reads, output_ptr, table_size, read_count);
    //stop time here
    gettimeofday(&t1,NULL);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);
    seconds = t1.tv_sec - t0.tv_sec;
    useconds = t1.tv_usec - t0.tv_usec;
	cout << "milliseconds: " << ((seconds) * 1000 + useconds/1000.0) << endl;
    cout << diff(time1,time2).tv_sec << ":" << diff(time1,time2).tv_nsec<<endl;

    //cny_cp_memcpy output to hostOutput
    cout << "copying to host memory" << endl;
	cny_cp_memcpy(hostOutput, output, read_count * 8);
    gettimeofday(&t2,NULL);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time3);
    seconds = t2.tv_sec - t1.tv_sec;
    useconds = t2.tv_usec - t1.tv_usec;
	cout << "milliseconds: " << ((seconds) * 1000 + useconds/1000.0) << endl;
    cout << diff(time2,time3).tv_sec << ":" << diff(time2,time3).tv_nsec<<endl;
    // Print output
    cout << "writing to string" << endl;
    char* sPtr = hostFormatOutput;
	for (count = 0; count < read_count; count++) {
		if (*((uint64 *) &hostOutput[count]) == 0xFFFFFFFFFFFFFFFFULL) {
			//outFile << count << ": -" << endl;
            sPtr += sprintf(sPtr,"%8lu: -\n", count);
		} else {
			if (hostOutput[count].others == 0) {
				//outFile << count << ": " << hostOutput[count].index << endl;
                sPtr += sprintf(sPtr, "%8lu: %9u\n", count, hostOutput[count].index);
			} else if (hostOutput[count].others > 2020) {
				//outFile << count << ": " << hostOutput[count].index << " + 236990858 others" << endl;
                sPtr += sprintf(sPtr, "%8lu: %9u + 236990858 others\n", count, hostOutput[count].index);
			} else {
                sPtr += sprintf(sPtr, "%8lu: %9u + %u others\n", count, hostOutput[count].index, hostOutput[count].others);
			    //outFile << count << ": " << hostOutput[count].index << " + " << hostOutput[count].others << endl;
            }
		}
	}
    gettimeofday(&t2,NULL);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time3);
    seconds = t2.tv_sec - t1.tv_sec;
    useconds = t2.tv_usec - t1.tv_usec;
	cout << "milliseconds: " << ((seconds) * 1000 + useconds/1000.0) << endl;
    cout << diff(time2,time3).tv_sec << ":" << diff(time2,time3).tv_nsec<<endl;
    //outFile.close();
    FILE *outFile = fopen("output", "wb");
    fwrite(hostFormatOutput, sPtr - hostFormatOutput, 1, outFile);
    fclose(outFile);
	// Clean up
	cny_cp_free((void *) genome);
	cny_cp_free((void *) hashtable);
	cny_cp_free((void *) reads);
	cny_cp_free((void *) output);
    free(hostFormatOutput);
    free(hostOutput);
	return 0;
}
