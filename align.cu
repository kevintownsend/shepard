/*
 * Really, really primitive DNA sequence aligner meant to demonstrate the
 * kinds of answers we want from your aligners.  This uses a brute-force
 * algorithm that can be greatly improved.
 *
 * Stephen A. Edwards, 2012
 *
 * Sample usage:
 *
 * ./align human_g1k_v37.bin ERR050082.filt.bin 100 0 9999
 *
 * The first argument is the reference genome in packed binary form.
 *
 * The second argument is the sequence file, also in packed binary form.
 *
 * The third argument is the number of base pairs per sequence
 *
 * The fourth (optional) argument is the starting sequence number
 *
 * The fifth (optional) argument is the ending sequence number
 *
 * If the ending sequence number is omitted, it is taken as the end of
 * the file.
 *
 * If the starting sequence number is omitted, it is taken as the
 * beginning of the file.
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>

/* Assumed alignment for sequences in the sequence file, in bytes */
#define SEQUENCE_ALIGN 8

/* Result of matching a single sequence; match() fills in an array */
struct match {
  long int position;      /* Position of a match if count > 0 */ //     off_t is an internal variable that limits the max length you can read from a file as an  
                                                                 //     offset from the current file pointer 
  unsigned int count;  /* Number of matches found */
};

/* For debugging: print a packed sequence */
void dump_sequence(char *bases, int bytes)
{
  static char base[] = {'A', 'C', 'G', 'T'};
  int i;
  for (i = 0 ; i != bytes; i++) {
      char c = bases[i];                                    // is this similar to doing c = *(bases+i)
      printf("%c%c%c%c",
	     base[c&0x3],
	     base[(c >> 2) & 0x3],
	     base[(c >> 4) & 0x3],
	     base[(c >> 6) & 0x3]);
    }
    printf("\n");
}

/* Attempt to match an array of two-bit sequences (*sequences)
 * against a reference sequence (*reference_base).
 *
 * Fill in the *matches array with the results.
 *
 * This allocates a buffer large enough to hold a single sequence
 * and shifts the whole reference sequence through it, one pair at a time.
 * At each point, this buffer is compared to each of the given sequences.
 */

                                  
__global__ void matchKernel(char *ref_genome_GPU, char *read_seq_GPU, struct match *result_GPU, long int reference_total,
int sequence_length,int N){

 char ref[25];

 long int p,last_p;

 __shared__ char seq[25];
 int i,j,count=3;

 for(i=0;i<N;i++)
 result_GPU[blockIdx.x].count = 0;

 /*Copy first 100 base pairs from global memory to block shared memory*/
  for(i=0;i<25;i++)
  ref[i]=ref_genome_GPU[i];
 
 
 /*Copy read sequence from global memory to internal register */

  for(i=0;i<25;i++)
  seq[i]= read_seq_GPU[blockIdx.x*32 + i];
  
 last_p = (reference_total*4) - sequence_length;

 for(p=0;p<last_p;p++)
   {
    char temp=0,read_match=1,shift_in=0,shift_out=0;
 
    if(count==-1)count=3;
    
      for(i=0;i<25;i++){
         
         if(seq[i]!=ref[i]){
         read_match=0;
         break;
         }            
       }
    if(read_match){
             result_GPU[blockIdx.x].count++;
             result_GPU[blockIdx.x].position=p;    
             }
 /*To get new base pair at the last 2 bits of ref[], swap first two BP with last 2 BP of previous byte moveing from end of  
   reference array to the start*/

   for(i=24;i>-1;i--){
       shift_out=(ref[i]<<6)&0xC0;
       ref[i] = ((ref[i]>>2)&0x3F)| shift_in;
       shift_in = shift_out;
      }
  
  

 /*Attach two BP from the next byte of the reference genome to the last 2 bits of the last byte of reference buffer*/   
   
   ref[24]&=0x3F;
   temp = ref_genome_GPU[(p+100)>>2]<<(2*count);
   ref[24]|=temp&0xC0;
   count--;
  }

}

void match(struct match *matches, /* Output array, one per sequence */
	   char *reference_base,  /* Beginning of reference sequence */
	   long int reference_total, /* Number of bytes in the reference */
	   char *sequences,       /* Beginning of sequences */
	   int start_sequence,    /* Index of first sequence in array */
	   int sequence_length,   /* Base pairs per sequence */
	   int end_sequence)      /* One more than index of last sequence */
{
  /* Bytes per sequence, padded to be a multiple of SEQUENCE_ALIGN */
  int sequence_bytes = ((sequence_length + SEQUENCE_ALIGN * 4 - 1) & 
                        ~(SEQUENCE_ALIGN*4 - 1)) >> 2;
  int N = end_sequence-start_sequence;
 
  /*Declare pointers to the GPU memory*/

   char *ref_genome_GPU;
   char *read_seq_GPU;
   struct match *result_GPU;

   dim3 dimBlock(1,1,1);
   dim3 dimGrid(N,1,1);
   

  /*Allocate memory on GPU */

  cudaMalloc((void**) &ref_genome_GPU, reference_total);
  cudaMalloc((void**) &read_seq_GPU, N*sequence_bytes);
  cudaMalloc((void**) &result_GPU, sizeof(struct match)*N);

  /*copy the Reference Genome and read sequences from host to GPU global memory*/

  cudaMemcpy(ref_genome_GPU,reference_base,reference_total,cudaMemcpyHostToDevice);
  cudaMemcpy(read_seq_GPU,sequences,N*sequence_bytes,cudaMemcpyHostToDevice);

  
  /*Kernel call*/

 matchKernel<<<dimGrid,dimBlock>>>(ref_genome_GPU,read_seq_GPU, result_GPU, reference_total, sequence_length,N);


  /*Copy result from GPU memory to host*/
  
 cudaMemcpy(matches,result_GPU, sizeof(struct match)*N,cudaMemcpyDeviceToHost);

 /*Free the GPU memory*/
  
 cudaFree(ref_genome_GPU);
 cudaFree(read_seq_GPU);
 cudaFree(result_GPU);
 
 

}

/*
 * Process command-line arguments, map reference and sequence data into
 * memory, call match(), and print the results
 */

int main(int argc, const char *argv[])
{
  const char *reference_filename, *sequence_filename;                           // declare pointers to reference and read files
 

  int reference_fd = -1, sequence_fd = -1;                                     // reference_fd & sequence_fd are used as a file handles to reference & read files
   
 /*sequence length used for storing the length of one read
   sequence bytes is the padded length of one read
   start and end sequences store the start and end index to do the matching
   num sequecne denotess the number of sequences in one read file*/

 int sequence_length, sequence_bytes, start_sequence = -1, end_sequence = -1,
     num_sequences, i;

  
  long int reference_total, sequence_total, sequence_window_offset;
  
  size_t sequence_window_length;                                                // size_t is a internal type that any defined type is later mapped to for use in 
                                                                                //functions like strlen(), malloc and so on
  long int page_size;

  void *reference_base, *sequence_base;

  char *sequences;
  
  struct stat file_status;                                          // The stat structure type is used to return information about the attributes of a file. 

  struct match *matches;
  

  /*On modern operating systems, it is possible to mmap (pronounced "em-map") a file to a region of memory. When this is done, the file can be accessed just like an array in the program. Since mmapped pages can be stored back to their file when physical memory is low, it is possible to mmap files orders of magnitude larger than both the physical memory and swap space. The only limit is address space. Memory mapping only works on entire pages of memory. Thus, addresses for mapping     must be page-aligned, and length values will be rounded up. To determine the size of a page the machine uses one should use
size_t page_size = (size_t) sysconf (_SC_PAGESIZE);*/

  page_size = sysconf(_SC_PAGE_SIZE);                              /* needed for mmap */

  if (argc < 4) goto usage;

  reference_filename = argv[1];                                    // point reference file pointer to the first argument
  sequence_filename = argv[2];                                     // point read file pointer to the second argument

  sequence_length = atoi(argv[3]);                                 // sequence length stores the length of one read

  /* Pad the sequences out to a multiple of SEQUENCE_ALIGN bytes */
  sequence_bytes = ((sequence_length + SEQUENCE_ALIGN * 4 - 1) & 
		    ~(SEQUENCE_ALIGN * 4 - 1)) >> 2;               // sequence length = 100, sequence bytes is 32

  if (sequence_length <= 0) {
    fprintf(stderr,
	    "Error: given sequence length must be an integer greater than zero\n");
    goto usage;
  }

  if ((reference_fd = open(reference_filename, O_RDONLY)) < 0) {      // check if reference genome file opened correctly
    fprintf(stderr, "Error opening reference file \"%s\": ",
	    reference_filename);
    perror((const char *) 0);
    goto usage;
  }

  if (fstat(reference_fd, &file_status)) {                           // check if the reference genome file status is correct.
    fprintf(stderr, "Error checking reference file \"%s\": ",
	    reference_filename);
    perror((const char *) 0);
    goto usage;
  }

  reference_total = file_status.st_size;                                   // file_status.st_size returns the size of the reference genome file

  if (reference_total < sequence_bytes) {                                  // check if the genome is bigger than the read
    fprintf(stderr, "Error: reference file is shorter than the given sequence length (%d)\n", sequence_length);
    goto usage;
  }

 
  if ((sequence_fd = open(sequence_filename, O_RDONLY)) < 0) {             // check if read sequence file opened correctly
    fprintf(stderr, "Error opening sequence file \"%s\": ", sequence_filename);
    perror((const char *) 0);
    goto usage;
  }

  if (fstat(sequence_fd, &file_status)) {                                 // check if read sequence file status is correct
    fprintf(stderr, "Error checking sequence file \"%s\": ", sequence_filename);
    perror((const char *) 0);
    goto usage;
  }
 
  sequence_total = file_status.st_size;                                    // assign size of sequence file to sequence total 

  if (sequence_total < sequence_bytes) {                                   // check if the read sequence if biggeer than user input
    fprintf(stderr, "Sequence file is too small\n");
    goto usage;
  }

  if (sequence_total % sequence_bytes != 0)                                
    fprintf(stderr, "Warning: sequence file may be truncated\n");

  num_sequences = sequence_total / sequence_bytes;                          // calculate total number of read sequences

  if (argc > 4) start_sequence = atoi(argv[4]);
  if (start_sequence < 0) start_sequence = 0;
  if (start_sequence >= num_sequences) {
    fprintf(stderr, "Error: initial sequence number must be less than %d\n",
	    num_sequences);
    goto usage;
  }

  if (argc > 5) end_sequence = atoi(argv[5]);
  else end_sequence = num_sequences;
  if (end_sequence < start_sequence || end_sequence > num_sequences) {
    fprintf(stderr, "Error: End sequence number must be between %d and %d\n",
	    start_sequence, num_sequences);
    goto closeexit;
  }

  /* mmap the reference data */
  /*pa=mmap(addr, len, prot, flags, fildes, off);

  The mmap() function shall establish a mapping between the address space of the process at an address pa for len bytes to the memory object represented by the file 
  descriptor fildes at offset off for len bytes. */
  reference_base = mmap( (void*) 0, reference_total, PROT_READ, MAP_SHARED,
			 reference_fd, 0);

  if (reference_base == MAP_FAILED) {
    perror("Error when attempting to map the reference file");
    goto closeexit;
  }

  /* mmap the sequence data */

  /* compute the starting location by rounding down to the nearest
     page boundary; window length is the difference between this and the last
     page on which the sequences fall */
  sequence_window_offset = (start_sequence * sequence_bytes) & ~(page_size - 1);
  sequence_window_length = (((end_sequence * sequence_bytes) + (page_size - 1))
			    & ~(page_size - 1)) - sequence_window_offset;

  sequence_base = mmap( (void *) 0, sequence_window_length, PROT_READ,
			MAP_SHARED, sequence_fd, sequence_window_offset);

  
 

  if (sequence_base == MAP_FAILED) {
    perror("Error when attempting to map the sequence file");
    goto closeexit;
  }
 sequences = (char*)sequence_base + ((start_sequence * sequence_bytes) - sequence_window_offset);

  /* Allocate space to hold the results of matching */

  matches = (struct match*)malloc(sizeof(struct match)*(end_sequence - start_sequence));
  if (matches == NULL) {
    fprintf(stderr, "Failed to allocate memory for match information\n");
    goto unmap_sequences;
  }

  for ( i = 0 ; i < end_sequence - start_sequence ; i++ )
    matches[i].count = 0;

  
  match(matches,(char *)reference_base, reference_total, (char *)sequences, start_sequence, sequence_length, end_sequence);

  /* Report all matches */
  for (i = start_sequence ; i != end_sequence ; ++i) {
    printf("%8d: ", i);
    if (matches[i - start_sequence].count) {
      printf("%9ld", matches[i - start_sequence].position);
      if (matches[i-start_sequence].count > 1)
	printf(" + %d others", matches[i-start_sequence].count - 1);
      printf("\n");
    } else
      printf("-\n");
  }

  free(matches);

 unmap_sequences:
  if (munmap(sequence_base, sequence_window_length)) {
    perror("Error when unmapping the sequence file");
    goto closeexit;
  }

 unmap_references:
  if (munmap(reference_base, reference_total)) {
    perror("Error when unmapping the reference file");
    goto closeexit;
  }

  close(sequence_fd);
  close(reference_fd);
  return 0;

 usage:
  fprintf(stderr,
	  "usage: align <reference-genome> <sequence-file> <sequence-length> <start> <end>\n"
	  "<reference-genome> is the name of a packed binary reference sequence.\n"
	  "<sequence-file> is the name of a packed binary sequence file.\n"
	  "<sequence-length> is an integer indicating the length, in base pairs, of each sequence.\n"
	  "<start> is the optional starting sequence number.  If omitted, it defaults to the start of the sequence file.\n"
	  "<end> is the optional ending sequence number.  If omitted, it defaults to the end of the sequence file.\n");
 closeexit:
  if (reference_fd >= 0) close(reference_fd);
  if (sequence_fd >= 0) close(sequence_fd);
  return 1;
}
