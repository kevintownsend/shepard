/* hash-align.c
 * Uses a static hash table sructure stored in hash_table1.bin and
 * hash_table2.bin, based on 16-bit binary strings from the supplied 
 * genome_file, and performs alignment on the sequence file. 
 * Sample usage:
 *
 * ./align human_g1k_v37.bin ERR050082.filt.bin hash_table1.bin hash_table2.bin 12 0 9999
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
#include <stdint.h>
#include <time.h>
#include <pthread.h>


//#define HASH_LENGTH 2
//#define TABLE_LENGTH 65536

//#define HASH_LENGTH 3
//#define TABLE_LENGTH 16777216

#define HASH_LENGTH 4
#define TABLE_LENGTH 4294967296

/* Assumed alignment for sequences in the sequence file, in bytes */
#define SEQUENCE_ALIGN 8

/* Result of matching a single sequence; match() fills in an array */
struct match {
  off_t position;      /* Position of a match if count > 0 */
  unsigned int count;  /* Number of matches found */
};


/* Structure for per-thread data, to play nicely with pthreads */
struct thread_data {
  struct match *matches;   
  uint32_t *table1_base;
  off_t table1_total;
  uint64_t *table2_base;
  off_t table2_total;
  uint64_t *reference_base;
  off_t reference_total;
  void *sequences;
  uint32_t start_sequence;
  uint32_t sequence_length;
  uint32_t end_sequence;  
  uint32_t thread_id;
};

uint16_t NUM_THREADS;
struct thread_data *thread_data_array;




/* Attempt to match an array of two-bit sequences (*sequences)
 * against a reference sequence (*reference_base).
 *
 * Fill in the *matches array with the results.
 *
 * This allocates a buffer large enough to hold a single sequence
 * and shifts a portion of the reference sequence through it, based on 
 * the starting indexes pointed to by hash_table1.  
 * At each point, this buffer is compared to each of the given sequences.
 */
void match(struct match *matches,    /* Output array, one per sequence */
	   uint32_t *table1_base,    /* Beginning of hash_table1 */
	   off_t table1_total,       /* Number of bytes in hash_table1 */
	   uint64_t *table2_base,    /* Beginning of hash_table2 */
	   off_t table2_total,       /* Number of bytes in hash_table2 */
	   uint64_t *reference_base, /* Beginning of reference sequence */
	   off_t reference_total,    /* Number of bytes in the reference */
	   void *sequences,          /* Beginning of sequences */
	   int32_t start_sequence,   /* Index of first sequence in array */
	   int32_t sequence_length,  /* Base pairs per sequence */
	   int32_t end_sequence)     /* One more than index of last sequence */
{

  uint32_t s, i, j, k;
  uint64_t *cur_seq, *cur_ref;
  uint64_t hash_value;
  uint32_t start_ref_index, end_ref_index, ref_index;
  uint8_t shamt, cur_match;
  uint64_t seq_val, ref_val1, ref_val2;

  /* Bytes per sequence, padded to be a multiple of SEQUENCE_ALIGN */
  int32_t sequence_bytes = ((sequence_length + SEQUENCE_ALIGN * 4 - 1) & 
			    ~(SEQUENCE_ALIGN*4 - 1)) >> 2;


  /* Loop through the sequence array */
  cur_seq = (uint64_t *)sequences + start_sequence*sequence_bytes/8;
  for (s = start_sequence; s < end_sequence; s++) {

    hash_value = cur_seq[0] >> (64-HASH_LENGTH*8);

    start_ref_index = table1_base[hash_value];
    if (hash_value < TABLE_LENGTH-1) {
      end_ref_index = table1_base[hash_value+1];
    }
    else {
      end_ref_index = (table2_total)/4;
    }


    /* We only need to compare against the reference values that matched
     * the hash table function */
    for (i = start_ref_index; i < end_ref_index; i++) {
      ref_index = (uint32_t)(table2_base[i] & 0x0FFFFFFFF);

      /* Grab the current (byte-aligned) reference pointer. The shamt
       * variable dicatates how much modification is needed
       */
      cur_ref = (uint64_t *)reference_base + ref_index/32;      
      shamt = (ref_index % 32)*2;


      /* The memcmp method is inefficient when ref_index%32 != 0. We want to 
       * avoid all of the copy/shift operations to align the cur_ref, and 
       * instead can compare byte-by-byte and stop shifting when we're done
       */
      cur_match = 1;
      for (j = 0; j < 4; j++) {
	seq_val = cur_seq[j];
	ref_val1 = cur_ref[j];
	ref_val2 = cur_ref[j+1];

	if (shamt) {
	  ref_val1 = (uint64_t)ref_val1 >> shamt;
	  ref_val1 = ref_val1 | (uint64_t)(ref_val2 & (0xFFFFFFFFFFFFFFFFULL >> (64-shamt))) << (64-shamt);

	}

	if (seq_val != ref_val1) {
	  if (j == 3 && ((seq_val & 0x00000000000000FFULL) == 
			 (ref_val1 & 0x00000000000000FFULL))) {
	  }
	  else {
	    cur_match = 0;
	  }
	  break;
	}
      }


      if (cur_match == 1) {
	matches[s].count = (uint32_t)((table2_base[i] >> 32) & 0xFFFFFFFF) ;
	matches[s].position = ref_index;
	printf("Found a match, with %u counts\n", matches[s].count);

	/* We can break once we find a match, since the hash_table2
	 * also contains the count information */
	break;
      }

    }

    cur_seq += sequence_bytes/8;

    

  }


}



void *threadmatch(void *arg) {

  struct thread_data *local_data;

  local_data = (struct thread_data *)arg;

  match(local_data->matches, 
	local_data->table1_base, 
	local_data->table1_total,
	local_data->table2_base, 
	local_data->table2_total,
	local_data->reference_base, 
	local_data->reference_total,
	local_data->sequences, 
	local_data->start_sequence, 
	local_data->sequence_length, 
	local_data->end_sequence);

  return NULL;

}



/*
 * Process command-line arguments, map reference and sequence data into
 * memory, call match(), and print the results
 */

int main(int argc, const char *argv[]) {
  const uint8_t *reference_filename, *sequence_filename;
  const uint8_t *table1_filename, *table2_filename;

  int32_t reference_fd = -1, sequence_fd = -1;
  int32_t table1_fd = -1, table2_fd = -1;

  int sequence_length, sequence_bytes, start_sequence = -1, end_sequence = -1,
    num_sequences, i;
  off_t reference_total, sequence_total, sequence_window_offset;
  off_t table1_total, table2_total;
  size_t sequence_window_length;

  long page_size;

  void *reference_base, *sequence_base, *sequences;
  void *table1_base, *table2_base;

  struct stat file_status;

  struct match *matches;

  struct timeval mytime[2];
  struct timeval timediff;
  float ftime;

  pthread_t threads[NUM_THREADS];
  pthread_attr_t pthread_custom_attr;
  int32_t rc;

  int32_t total_seq, seq_batch, seq_rem, start_seq, end_seq;



  page_size = sysconf(_SC_PAGE_SIZE); /* needed for mmap */


  if (argc < 6) goto usage;

  reference_filename = argv[1];
  sequence_filename = argv[2];
  table1_filename = argv[3];
  table2_filename = argv[4];

  NUM_THREADS = atoi(argv[5]);
  if (NUM_THREADS <= 0) {
    fprintf(stderr, "Error: num_threads must be > 0\n");
    goto usage;
  }

  sequence_length = 100;
  /* Pad the sequences out to a multiple of SEQUENCE_ALIGN bytes */
  sequence_bytes = ((sequence_length + SEQUENCE_ALIGN * 4 - 1) & 
		    ~(SEQUENCE_ALIGN * 4 - 1)) >> 2;

  if (sequence_length <= 0) {
    fprintf(stderr,
       "Error: given sequence length must be an integer greater than zero\n");
    goto usage;
  }

  if ((reference_fd = open(reference_filename, O_RDONLY)) < 0) {
    fprintf(stderr, "Error opening reference file \"%s\": ",
	    reference_filename);
    perror((const char *) 0);
    goto usage;
  }

  if (fstat(reference_fd, &file_status)) {
    fprintf(stderr, "Error checking reference file \"%s\": ",
	    reference_filename);
    perror((const char *) 0);
    goto usage;
  }

  reference_total = file_status.st_size;

  if (reference_total < sequence_bytes) {
    fprintf(stderr, "Error: reference file is shorter than the given sequence length (%d)\n", sequence_length);
    goto usage;
  }

  if ((sequence_fd = open(sequence_filename, O_RDONLY)) < 0) {
    fprintf(stderr, "Error opening sequence file \"%s\": ", sequence_filename);
    perror((const char *) 0);
    goto usage;
  }

  if (fstat(sequence_fd, &file_status)) {
    fprintf(stderr, "Error checking sequence file \"%s\": ", 
	    sequence_filename);
    perror((const char *) 0);
    goto usage;
  }

  sequence_total = file_status.st_size;
  if (sequence_total < sequence_bytes) {
    fprintf(stderr, "Sequence file is too small\n");
    goto usage;
  }

  if (sequence_total % sequence_bytes != 0)
    fprintf(stderr, "Warning: sequence file may be truncated\n");

  num_sequences = sequence_total / sequence_bytes;

  if (argc > 4) start_sequence = atoi(argv[6]);
  if (start_sequence < 0) start_sequence = 0;
  if (start_sequence >= num_sequences) {
    fprintf(stderr, "Error: initial sequence number must be less than %d\n",
	    num_sequences);
    goto usage;
  }

  if (argc > 5) end_sequence = atoi(argv[7]);
  else end_sequence = num_sequences;
  if (end_sequence < start_sequence || end_sequence > num_sequences) {
    fprintf(stderr, "Error: End sequence number must be between %d and %d\n",
	    start_sequence, num_sequences);
    goto closeexit;
  }


  /* Open the hash table files */
  if ((table1_fd = open(table1_filename, O_RDONLY)) < 0) {
    fprintf(stderr, "Error opening %s file", table1_filename);
    perror((const char *) 0);
    goto usage;
  }

  if (fstat(table1_fd, &file_status)) {
    fprintf(stderr, "Error checking hash_table1.bin file");
    perror((const char *) 0);
    goto usage;
  }
  table1_total = file_status.st_size;


  /* Open the hash table files */
  if ((table2_fd = open(table2_filename, O_RDONLY)) < 0) {
    fprintf(stderr, "Error opening %s file", table1_filename);
    perror((const char *) 0);
    goto usage;
  }

  if (fstat(table2_fd, &file_status)) {
    fprintf(stderr, "Error checking hash_table2.bin file");
    perror((const char *) 0);
    goto usage;
  }
  table2_total = file_status.st_size;


  /* mmap the reference data */
  reference_base = mmap( (void *) 0, reference_total, PROT_READ, MAP_SHARED,
			 reference_fd, 0);

  if (reference_base == MAP_FAILED) {
    perror("Error when attempting to map the reference file");
    goto closeexit;
  }


  /* mmap the hash_table data */
  table1_base = mmap( (void *) 0, table1_total, PROT_READ, MAP_SHARED,
			 table1_fd, 0);

  if (table1_base == MAP_FAILED) {
    perror("Error when attempting to map the hash_table1 file");
    goto closeexit;
  }

  /* mmap the hash_table data */
  table2_base = mmap( (void *) 0, table2_total, PROT_READ, MAP_SHARED,
			 table2_fd, 0);

  if (table2_base == MAP_FAILED) {
    perror("Error when attempting to map the hash_table1 file");
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

  sequences = sequence_base +
    ((start_sequence * sequence_bytes) - sequence_window_offset);


  /* Allocate space to hold the results of matching */
  matches = malloc(sizeof(struct match) * (end_sequence - start_sequence));
  if (matches == NULL) {
    fprintf(stderr, "Failed to allocate memory for match information\n");
    goto unmap_sequences;
  }


  for ( i = 0 ; i < end_sequence - start_sequence ; i++ )
    matches[i].count = 0;


  /* Set up the pthreads shared data structures and input arguments */
  thread_data_array = (struct thread_data *)malloc(sizeof(struct thread_data) * NUM_THREADS);
  if (thread_data_array == NULL) {
    fprintf(stderr, "Failed to allocate memory for thread data\n");
    goto unmap_sequences;
  }


  total_seq = end_sequence - start_sequence;
  seq_batch = total_seq / NUM_THREADS;
  seq_rem = total_seq % NUM_THREADS;
  start_seq = start_sequence;
 
  for (i = 0; i < NUM_THREADS; i++) {

    thread_data_array[i].matches = matches;
    thread_data_array[i].table1_base = (uint32_t *)table1_base;
    thread_data_array[i].table1_total = table1_total;
    thread_data_array[i].table2_base = (uint64_t *)table2_base;
    thread_data_array[i].table2_total = table2_total;
    thread_data_array[i].reference_base = (uint64_t *)reference_base;
    thread_data_array[i].reference_total = reference_total;
    thread_data_array[i].sequences = sequences;
    thread_data_array[i].sequence_length = sequence_length;
    thread_data_array[i].thread_id = i;

    end_seq = start_seq + seq_batch;
    if (seq_rem != 0) {
      end_seq++;
      seq_rem--;
    }

    thread_data_array[i].start_sequence = start_seq;
    thread_data_array[i].end_sequence = end_seq;
    start_seq = end_seq;

  }

  pthread_attr_init(&pthread_custom_attr);
  //pthread_attr_setdetachstate(&pthread_custom_attr, PTHREAD_CREATE_JOINABLE);

  gettimeofday(&mytime[0], NULL);
  /* Call the sequence matcher with the starting address of the reference,
     starting address of the sequences, the ending address, the number
     of pairs in the sequence, and the length of the reference */
  for (i = 0; i < NUM_THREADS; i++) {
    rc = pthread_create(&threads[i], &pthread_custom_attr, threadmatch, 
			(void *)&thread_data_array[i]);
    if (rc) {
      fprintf(stderr, "ERROR: return code from pthread_create() is %d\n", rc);
      exit(-1);
    }

  }

  for (i = 0; i < NUM_THREADS; i++) {
    pthread_join(threads[i], NULL);
  }


  /*  match(matches, 
   *(uint32_t *)table1_base, table1_total,
   *(uint32_t *)table2_base, table2_total,
   *reference_base, reference_total,
   *sequences, start_sequence, sequence_length, end_sequence);
   */
  gettimeofday(&mytime[1], NULL);

  /* Calculate the runtime */
  timediff.tv_usec = mytime[1].tv_usec - mytime[0].tv_usec;
  timediff.tv_sec = mytime[1].tv_sec - mytime[0].tv_sec;
  if (mytime[0].tv_usec > mytime[1].tv_usec) {
    timediff.tv_usec += 1000000;
    timediff.tv_sec--;
  }
  ftime = (float)timediff.tv_sec + ((float)timediff.tv_usec / 1000000.0);

  fprintf(stderr, "Runtime - %f sec\n", ftime);



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

 unmap_table1:
  if (munmap(table1_base, table1_total)) {
    perror("Error when unmapping the hash_table1 file");
    goto closeexit;
  }  

 unmap_table2:
  if (munmap(table2_base, table2_total)) {
    perror("Error when unmapping the hash_table2 file");
    goto closeexit;
  }  


  close(sequence_fd);
  close(reference_fd);
  close(table1_fd);
  close(table2_fd);
  return 0;

 usage:
  fprintf(stderr,
	  "usage: align <reference-genome> <sequence-file> <hash_table1> <hash_table2> <num_threads> <start> <end>\n"
	  "<reference-genome> is the name of a packed binary reference sequence.\n"
	  "<sequence-file> is the name of a packed binary sequence file.\n"
	  "<num_threads> is an integer indicating the pthreads.\n"
	  "<start> is the optional starting sequence number.  If omitted, it defaults to the start of the sequence file.\n"
	  "<end> is the optional ending sequence number.  If omitted, it defaults to the end of the sequence file.\n");
 closeexit:
  if (reference_fd >= 0) close(reference_fd);
  if (sequence_fd >= 0) close(sequence_fd);
  return 1;
}
