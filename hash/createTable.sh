#!/bin/bash

genome=ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/technical/reference/human_g1k_v37.fasta.gz
shepard=/var/tmp/Shepard

mkdir $shepard

wget -qO- $genome | gunzip -c | ../reference/fasta2bin > /dev/shm/human.bin
cp /dev/shm/human.bin $shepard

./bin/countUnique /dev/shm/human.bin $shepard/unique.bin
rm /dev/shm/temp*

./bin/createHashTable /dev/shm/human.bin $shepard/unique.bin $shepard/hashtable.bin
