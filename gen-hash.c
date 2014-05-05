/* gen-hash.c
 * Creates a dynamic hash table structure, based on 16-bit 
 * binary strings from the supplied genome_file. Converts
 * the dynamic hash structure into two static structures, and
 * outputs those as two binary files. 
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

//#define HASH_LENGTH 2
//#define TABLE_LENGTH 65536

//#define HASH_LENGTH 3
//#define TABLE_LENGTH 16777216

#define HASH_LENGTH 4
#define TABLE_LENGTH 4294967296

#define NUM_BLOCKS 4

/* Dynamic hash table entry */
typedef struct hash_entry_s {
  uint32_t position;
  uint32_t count;
  struct hash_entry_s *next;	
} hash_entry_t;


hash_entry_t **hash_heads, **hash_tails;


uint8_t ismatch(uint64_t *reference_base, uint32_t pos1, uint32_t pos2) {

  uint8_t shamt1, shamt2;
  uint32_t i;
  uint64_t dword1[2], dword2[2];
  uint64_t dword;

  shamt1 = (pos1 % 32)*2;
  shamt2 = (pos2 % 32)*2;



  for (i = 0; i < 4; i++) {
    dword1[0] = reference_base[pos1/32+i];
    dword1[1] = reference_base[pos1/32+i+1];
    dword2[0] = reference_base[pos2/32+i];
    dword2[1] = reference_base[pos2/32+i+1];    


   if (shamt1 != 0) {
     dword1[0] = (uint64_t)dword1[0] >> shamt1;
     dword1[0] = dword1[0] | (uint64_t)(dword1[1] & (0xFFFFFFFFFFFFFFFFULL >> (64-shamt1))) << (64-shamt1);
   }


   if (shamt2 != 0) {
     dword2[0] = (uint64_t)dword2[0] >> shamt2;
     dword2[0] = dword2[0] | (uint64_t)(dword2[1] & (0xFFFFFFFFFFFFFFFFULL >> (64-shamt2))) << (64-shamt2);
   }
   
  
   if (dword1[0] != dword2[0]) {
     
     /* We have to take special care of the 25th byte, which is the only valid
      * part of the 4th dword */
     if (i == 3 && ((dword1[0] & 0x00000000000000FFULL) == 
		    (dword2[0] & 0x00000000000000FFULL))) {
       return 1;
     }
     else {
       return 0;
     }
   }
   
  }
  
  
  return 1;
}


void gen_hash(uint64_t *reference_base, off_t reference_total, 
	      uint64_t seq_min, uint64_t seq_max) {
	
  uint32_t i, j, k, index;
  uint32_t seq;
  uint64_t dwords[2];
  uint8_t new;
  hash_entry_t *hash_tmp, *hash_tmp2;
	

  /* Allocate memory for the hash table */
  hash_heads = (hash_entry_t **)calloc(TABLE_LENGTH, sizeof(hash_entry_t *));
  hash_tails = (hash_entry_t **)calloc(TABLE_LENGTH, sizeof(hash_entry_t *));



  /* As we loop through the reference genome, we can stop indexing when
   * there is no more room for a full match anyway */
  for (i = 0; i < (reference_total)/8-3; i++) {

    dwords[0] = reference_base[i];
    dwords[1] = reference_base[i+1];

    for (j = 0; j < 32; j++) {

      /* The prefix tree is a function of HASH_LENGTH. Look at that many bytes.
       */
      seq = (uint32_t)(dwords[0] >> (64-HASH_LENGTH*8));


      /* Partition the hash table based on seq_min and seq_max */
      if (seq >= seq_min && (uint64_t)seq < seq_max) {

	//printf("Calculated sequence @ %i of %04x\n", 32*i+j,seq);
    
	/* Allocate a new hash node */
	hash_tmp = (hash_entry_t *)malloc(sizeof(hash_entry_t));
	if (!hash_tmp) {
	  perror("Error when allocating hash table memory\n");
	}

	hash_tmp->position = 32*i+j;
	hash_tmp->count = 1;
	hash_tmp->next = NULL;

     
	/* If it's the first node in the row, set the pointers appropriately */
	if (hash_heads[seq] == NULL) {
	  if (seq % 128 == 0)
	    printf("Found first entry for %08x, at position %u\n", seq, 32*i+j);
	  hash_heads[seq] = hash_tmp;
	  hash_tails[seq] = hash_tmp;
	}

	/* Otherwise, don't even add it if there is an existing match.
	 * Use the most recent positional value to match the spec output */
	else {
	  new = 1;
	  for (hash_tmp2 = hash_heads[seq]; 
	       hash_tmp2 != NULL; 
	       hash_tmp2 = hash_tmp2->next) {
	    //printf("Checking index %u against %u\n", hash_tmp->position, hash_tmp2->position);
	    if (ismatch(reference_base, 
			hash_tmp2->position, hash_tmp->position)) {
	      //printf("Reference index %u matches %u\n", hash_tmp->position, hash_tmp2->position);
	      new = 0;
	      hash_tmp2->count++;
	      hash_tmp2->position = hash_tmp->position;
	      free(hash_tmp);
	      break;
	    }
	  }

	  if (new == 1) {
	    hash_tails[seq]->next = hash_tmp;
	    hash_tails[seq] = hash_tmp;
	  }
	}

      }

      /* Update the sequence value by shifting out 2 bits, and shifting
       * in 2 bits from the next reference_base dword. We've simplified this
       * somewhat by getting rid of the byte ordering */
    update_seq:
      dwords[0] = dwords[0] >> 2;
      //dwords[0] = dwords[0] | ((uint64_t)(dwords[1] & 0xFFFFFFFFFFFFFFFFULL) >> 62) << 62;
      dwords[0] = dwords[0] | ((dwords[1] & 0x3) << 62);
      dwords[1] = dwords[1] >> 2;
    }
  }
  return;	
}

void bin_hash(uint64_t seq_min, uint64_t seq_max) {
  FILE *fp1, *fp2;
  uint32_t  j, matches, prev_matches;
  uint64_t i;
  hash_entry_t *hash_ptr, *prev_ptr;
  uint32_t *table1;
  uint64_t *table2;
  off_t table2_total;
  struct stat file_status;

  
  if (seq_min == 0) {
    fp1 = fopen("hash_table1.bin", "wb");
  }
  else {
    fp1 = fopen("hash_table1.bin", "ab");
  }

  if (fp1 == NULL) {
    fprintf(stderr, "Error: could not open hash_table1.bin for writing\n");
    return;		
  }


  if (seq_min == 0) {
    fp2 = fopen("hash_table2.bin", "wb");
  }
  else {
    fp2 = fopen("hash_table2.bin", "ab");
  }  
  if (fp2 == NULL) {
    fprintf(stderr, "Error: could not open hash_table2.bin for writing\n");
    return;		
  }

  if (fstat(fileno(fp2), &file_status)) {
    fprintf(stderr, "Error checking hash_table2.bin\n");
    perror((const char *) 0);
  }
  table2_total = file_status.st_size;


  table1 = (uint32_t *)malloc((seq_max-seq_min)*sizeof(uint32_t));
  if (!table1) {
    perror("Error when allocating hash table memory\n");
  }

  /* The start point of the current hash_table1 needs to be the size of 
   * the current hash_table2 */
  table1[0] = table2_total/8;
  prev_matches = 0;
  for (i = seq_min; i < seq_max; i++) {

    /* First, find the length of each row, and dump to the file */
    matches = 0;
    for (hash_ptr = hash_heads[i]; hash_ptr != NULL; 
	 hash_ptr = hash_ptr->next) {
      matches++;
    }


    if (matches)
      printf("Found %d matches for seq %08x\n", matches, i);


    table2 = (uint64_t *)malloc(matches*sizeof(uint64_t));
    if (!table2) {
      perror("Error when allocating hash table memory\n");
    }
    matches = 0;
    prev_ptr = NULL;
    for (hash_ptr = hash_heads[i]; hash_ptr != NULL; 
	 hash_ptr = hash_ptr->next) {
      table2[matches++] = (uint64_t)hash_ptr->position | ((uint64_t)hash_ptr->count << 32);

      if (prev_ptr != NULL) {
	free(prev_ptr);
      }
      prev_ptr = hash_ptr;
    }


    fwrite(table2, sizeof(uint64_t), matches, fp2);
    free(table2);
    
    /* Table1 is easy, first entry is 0 and then we increment by matches */
    if (i != seq_min) {
      table1[i-seq_min] = table1[i-seq_min-1] + prev_matches;
    }
    prev_matches = matches;

  }
  
  fwrite(table1, sizeof(uint32_t), seq_max-seq_min, fp1);

  free(table1);
  fclose(fp1);
  fclose(fp2);


  /* Free up some memory */
  free(hash_heads);
  free(hash_tails);

  
  return;
}

/*
 * Process command-line arguments, map reference and sequence data into
 * memory, and call hash()
 */
int main(int argc, const char *argv[]) {

  const uint8_t *reference_filename;
  int32_t reference_fd = -1;
  off_t reference_total;
  uint32_t i;

  long page_size;
  void *reference_base;
  struct stat file_status;  

  page_size = sysconf(_SC_PAGE_SIZE); /* needed for mmap */

  if (argc < 2) goto usage;

  reference_filename = argv[1];

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

  /* mmap the reference data */
  reference_base = mmap( (void *) 0, reference_total, PROT_READ, MAP_SHARED, 
			 reference_fd, 0);

  if (reference_base == MAP_FAILED) {
    perror("Error when attempting to map the reference file");
    goto closeexit;
  }


  //  for (i = 0; i < NUM_BLOCKS; i++) {
  for (i = 3; i < 4; i++) {
    printf("Starting iteration %d of %d...\n", i+1, NUM_BLOCKS);
    gen_hash(reference_base, reference_total, (TABLE_LENGTH/NUM_BLOCKS)*i, (TABLE_LENGTH/NUM_BLOCKS)*(i+1));
    bin_hash((TABLE_LENGTH/NUM_BLOCKS)*i, (TABLE_LENGTH/NUM_BLOCKS)*(i+1));
  }

 unmap_references:
  if (munmap(reference_base, reference_total)) {
    perror("Error when unmapping the reference file");
    goto closeexit;
  }

  close(reference_fd);
  return 0;

 usage:
  fprintf(stderr,
	  "usage: gen-hash <reference-genome>\n"
	  "<reference-genome> is the name of a packed binary reference sequence.\n");
 closeexit:
  if (reference_fd >= 0) close(reference_fd);
  return 1;
}
