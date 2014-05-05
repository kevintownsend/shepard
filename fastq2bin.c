/*
 * Convert a FASTQ file to a 64-bit packed binary format. 
 *
 * Typical usage:
 *
 * cat ERR050082.fastq | fastq2bin ERR050082.filt.bin
 */


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MAXLINE 1024

#define ALIGN 8

unsigned int line = 1;

int skipline()
{
  int i, c;

  for (i = 0 ; i < MAXLINE ; i++) {
    c = getchar();
    if (c == '\n' || c == '\r') {
      line++;
      return 1;
    }
    if (c == EOF) return 0;
  }
  fprintf(stderr, "Error:%d:line too long\n", line);
  exit(1);
}

int main(int argc, char *argv[]) {
  int c;
  unsigned char byte;
  uint64_t d;
  int i, bytes, expected_bytes = 0;
  FILE *fp;



  if (argc < 2) {
    fprintf(stderr, "Usage: cat file1.fastq | fastq2bin file1.bin");
    return 1;
  }

  fp = fopen(argv[1],"wb");
  if (!fp) {
    fprintf(stderr, "Cannot open file %s\n", argv[1]);
    return 1;
  }




  for (;;) {
    if ((c = getchar()) == EOF) break;
    if (c != '@') {
      fprintf(stderr,
	      "Error:%d:expected \"@\" at the beginning of a sequence read, not '%c'\n",
	      line, c);
      return 1;
    }
    if (!skipline()) {
      fprintf(stderr, "Error:%d:end-of-file in sequence identifier line\n", line);
      return 1;
    }

    byte = i = bytes = 0;
    d = 0;
    i = 0;
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
	line++;
	if (i) {
          //putchar(byte);
	  fwrite(&d, sizeof(uint64_t), 1, fp);
	  bytes++;
        }
	if (expected_bytes && bytes != expected_bytes) {
	  fprintf(stderr, "Error:%d:inconsistent sequence length\n", line-1);
	  return 1;
	} else expected_bytes = bytes;
	/* pad */
	//	for ( ; bytes & (ALIGN - 1) ; bytes++)  fwrite(&byte, 1, 1, fp);
	goto nextline;
	
      case EOF:
	fprintf(stderr, "Error:%d:unexpected end-of-file in a sequence\n", line);
	return 1;
      }

      i += 2;
      if (i == 64) {
	//putchar(byte);
	fwrite(&d, sizeof(uint64_t), 1, fp);	
        bytes++;
	byte = 0;
	d = 0;
	i = 0;
      }
    }
  nextline:

    if ((c = getchar()) == EOF) break;
    if (c != '+') {
      fprintf(stderr, "Error:%d:expected \"+\"\n", line);
      return 1;
    }

    if (!skipline()) {
      fprintf(stderr, "Error:%d: end-of-file in + line\n", line);
      return 1;
    }

    if (!skipline()) {
      fprintf(stderr,
	      "Error:%d:end-of-file in quality line\n", line);
      return 1;
    }
   
  }

  return 0;
}
