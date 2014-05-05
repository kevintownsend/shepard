# Joseph Zambreno
# 
# multi-align.sh - Script that runs the MEMOCODE 2012 challenge by partitioning
# the sequence data evenly across the specified list of machines.


#!/bin/bash


# Number of parallel jobs per machine
NUM_JOBS=1

# Local hostname, date, etc.
MYNAME=`hostname`
MYDATE=`date +%F`
MYTIME=`date +%c`
MYUSER=`whoami`

# Output directory. For now, just use the username information
#OUTDIR="/local/memocode-"$MYUSER"/"
OUTDIR="/dev/shm/memocode-"$MYUSER"/"
CDIR=`pwd`

# We are specific with the command-line arguments
NUMARGS=$#
if [ $NUMARGS -lt 7 ]; then
	echo "Usage: $0 file.lst genome.bin sequences.bin hash_table1.bin hash_table2.bin start_seq end_seq"
	exit;
fi

# Machines to run on, provided as a list in a file
MACHINES=`cat $1`
NUM_MACHINES=`cat $1 | wc -l`
# Human genome file
GENOME=$2
# Subsequence file
SEQUENCES=$3
# hash_table1
TABLE1=$4
# hash_table2
TABLE2=$5
# Starting sequence number
START_SEQ=$6
# Ending sequence number
END_SEQ=$7

NUM_TASKS=`expr $NUM_MACHINES \* $NUM_JOBS`


# Run the aligner application, keeping track of the results
echo "Running the aligner application"
declare -a PIDS
INDEX=0
rm -rf `echo $SEQUENCES"_*"`

# We have to do some quick math to balance the workload
TOTAL_SEQ=$(($END_SEQ-$START_SEQ))
SEQ_BATCH=$(($TOTAL_SEQ/$NUM_TASKS))
SEQ_REM=$(($TOTAL_SEQ%$NUM_TASKS))


START=$START_SEQ
for i in $MACHINES
do

  for (( j=1; j<=$NUM_JOBS; j++ )) 
  do

    END=$(($START+$SEQ_BATCH))
    if [ $SEQ_REM -ne 0 ]; then
	END=$((END+1))
	SEQ_REM=$((SEQ_REM-1))
    fi
    echo "Running ./hash-align $GENOME $SEQUENCES $TABLE1 $TABLE2 100 $START $END on $i..."
#    ssh -o StrictHostKeyChecking=no $i "cd $OUTDIR;./hash-align $GENOME $SEQUENCES $TABLE1 $TABLE2 100 $START $END > $CDIR'/'$SEQUENCES'_'$i'_'$j'_'$MYDATE" &
    ssh -o StrictHostKeyChecking=no $i "cd $OUTDIR;./hash-align $GENOME $SEQUENCES $TABLE1 $CDIR'/'$TABLE2 100 $START $END > $CDIR'/'$SEQUENCES'_'$i'_'$j'_'$MYDATE" &

    PIDS[INDEX++]=$!
    START=$((END))
    
  done

done


# Wait until all the processes are complete (does so in order, there might be
# a better way, but it might also not matter much)

for i in ${PIDS[@]}
do

  DONE=0
  while [[ $DONE = 0 ]]; do
    ps -p $i &> /dev/null
    if [[ $? -ne 0 ]]; then
	DONE=1
#    else 
	#sleep 10
    fi
  done

done

# Collect the results into one file
echo "Collecting results"
rm -rf $SEQUENCES"_final_"$MYDATE


for i in $MACHINES
do

  for (( j=1; j<=$NUM_JOBS; j++ )) 
  do
    cat $SEQUENCES"_"$i"_"$j"_"$MYDATE >> $CDIR"/"$SEQUENCES"_final_"$MYDATE
  done
done


