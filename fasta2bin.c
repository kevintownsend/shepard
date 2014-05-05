/*
 * Convert a FASTA file to a 64-bit packed binary format. 
 *
 * Typical usage:
 *
 * cat hum_glk_v37.fasta | fasta2bin human_glk_v37.bin
 */

#include <stdio.h>
#include <stdint.h>

#define MAXLINE 1024

int main(int argc, char *argv[]) {
  uint64_t d;
  int c, i;
  FILE *fp;


  if (argc < 2) {
    fprintf(stderr, "Usage: cat file1.fasta | fasta2bin file1.bin");
    return 1;
  }

  fp = fopen(argv[1],"wb");
  if (!fp) {
    fprintf(stderr, "Cannot open file %s\n", argv[1]);
    return 1;
  }



  /* Read and discard the header line */
  if (getchar() != '>') {
    fprintf(stderr, "Error: header line does not start with \">\"\n");
    return 1;
  }

  for (i = 0 ; ; i++) {
    c = getchar();
    if (c == '\n' || c == '\r') break;
    if (c == EOF) {
      fprintf(stderr, "Error: file ended before header line\n");
      return 1;
    }
    if (i == MAXLINE) {
      fprintf(stderr, "Error: header line is too long\n");
      return 1;
    }    
  }

  c = 0;
  i = 0;
  d = 0;

  for (;;) {

    switch (getchar()) {
    case 'A': break;
    case 'C': d |= ((uint64_t)1 << i); break;
    case 'G': d |= ((uint64_t)2 << i); break;
    case 'T': case 'U': d |= ((uint64_t)3 << i); break;

    case 'N': case 'K': case 'S': case 'Y':
    case 'M': case 'W': case 'R': case 'B':
    case 'D': case 'H': case 'V': case '-':
      break;

    case '\n': case '\r':
      continue;

    case EOF:
      if (i) fwrite(&d, sizeof(uint64_t), 1, fp); /* Flush any last bits */
      return 0;
    }


    i += 2;
    if (i == 64) {
      fwrite(&d, sizeof(uint64_t), 1, fp);
      i = 0;
      d = 0;
    }
  }
}
