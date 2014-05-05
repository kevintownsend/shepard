all: fasta2bin fastq2bin hash-align gen-hash

fasta2bin:
	gcc -o fasta2bin fasta2bin.c

fastq2bin:
	gcc -o fastq2bin fastq2bin.c

hash-align:
	gcc -o hash-align -O3 -m64 -funroll-loops -pthread hash-align.c

gen-hash:
	gcc -o gen-hash -O3 -m64 -funroll-loops gen-hash.c


clean:
	/bin/rm -f *.o
	/bin/rm -f hash-align gen-hash fasta2bin fastq2bin
	/bin/rm -f *~ *#


