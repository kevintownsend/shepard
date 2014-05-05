# Joseph Zambreno
# 
# setup-multi-align.sh - Script that configures the /local drive on a 
# specified list of machines to run the MEMOCODE 2012 challenge


#!/bin/bash

# Compiler. gcc for now, nvcc once we are satisfied with CUDA implementation
CC="gcc"

# Compile-only flag, to skip all the file copying (beyond the source)
COMPILE_ONLY=0

# Clean-up flag, in case you've left lots of junk in the directories
CLEANUP_ONLY=1

# Local hostname, date, etc.
MYNAME=`hostname`
MYDATE=`date +%F`
MYTIME=`date +%c`
MYUSER=`whoami`

# Output directory. For now, just use the username information
#OUTDIR="/local/memocode-"$MYUSER"/"
OUTDIR="/dev/shm/memocode-"$MYUSER"/"


# We are specific with the command-line arguments
NUMARGS=$#
if [ $NUMARGS -lt 6 ]; then
	echo "Usage: $0 file.lst source.c genome.bin sequences.bin hash_table1.bin hash_table2.bin"
	exit;
fi

for FILE in "$@"
do

  if [ ! -f $FILE ]; then
      echo "Error: cannot find $FILE"
      exit;
  fi
done


# Machines to run on, provided as a list in a file
MACHINES=`cat $1`
# Source file to compile
SOURCE=$2
# Human genome file
GENOME=$3
# Subsequence file
SEQUENCES=$4
# Hash table1 file
TABLE1=$5
# Hash table2 file
TABLE2=$6

echo "Running system connectivity test(s)"
# For each machine, start off by checking connectivity
for i in $MACHINES
do

  printf "%-50s" "Checking $i..."

  # An initial ssh connectivity check
  ssh -o StrictHostKeyChecking=no -o "ConnectTimeout 2" $i "echo ssh_test" &> /dev/null &
  PID=$!

	
# Wait for ssh to exit

  TIMEOUT=10
  while [[ $TIMEOUT -gt 0 ]]; do
    ps -p $PID &> /dev/null
    if [[ $? -ne 0 ]]; then
	break
    fi
    TIMEOUT=$(($TIMEOUT - 1))
    sleep 1
  done

# if the timeout reaches 0, then the process was killed. Report something.
  if [[ $TIMEOUT -le 0 ]]; then
      disown $PID
      kill -KILL $PID
      SSH_WORKING=="FAILED"
  else
      SSH_WORKING=`ssh -o StrictHostKeyChecking=no -o "ConnectTimeout 2" $i "echo ssh_test" 2> /dev/null`
  fi
  
  if [ "$SSH_WORKING" != "ssh_test" ]; then
      printf "\t\033[31m%-15s\033[0m\n" "NO CONNECTION"
      exit 1
  else 
      printf "\t\033[32m%-15s\033[0m\n" "VALID CONNECTION"
  fi

done

# Cleanup the files from the OUTDIR directory as needed. 
if [ $CLEANUP_ONLY = 1 ]; then
    for i in $MACHINES
      do
      printf "%-50s\n" "Cleaning up files on $i..."
      ssh -o StrictHostKeyChecking=no $i "rm -rf $OUTDIR" &
    done

else 


# Copy the necessary files over, into a new directory as needed
    for i in $MACHINES
      do
      printf "%-50s\n" "Copying files to $i..."
      ssh -o StrictHostKeyChecking=no $i "mkdir -p $OUTDIR"
      if [ $COMPILE_ONLY = 1 ]; then
	  scp $SOURCE $i":"$OUTDIR
      else
#	  scp $SOURCE $GENOME $SEQUENCES $TABLE1 $TABLE2 $i":"$OUTDIR
          scp $SOURCE $GENOME $SEQUENCES $TABLE1 $i":"$OUTDIR

      fi
      
    done


    echo "Compiling aligner application"
# Compile the aligner application
    for i in $MACHINES
      do
      printf "%-50s\n" "Compiling $SOURCE on $i..."
      ssh -o StrictHostKeyChecking=no $i "cd $OUTDIR;$CC -O3 -m64 -funroll-loops -o hash-align $SOURCE"
    done

fi