#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DATA_DIR=$SCRIPT_DIR/fastq
RES_DIR=$SCRIPT_DIR/results

if [ -d "$RES_DIR" ]; then rm -Rf $RES_DIR; fi

mkdir $RES_DIR

while IFS= read -r line
do
  args=($line)

  experiment_code=${args[0]}
  experiment_type=${args[1]}
  pair_file_1=$DATA_DIR/${args[2]}
  pair_file_2=$DATA_DIR/${args[3]}
  #echo $experiment_code
  #echo $experiment_type
  #echo $pair_file_1
  #echo $pair_file_2

  experiment_dir=$RES_DIR/$experiment_code
  mkdir $experiment_dir

  echo "Doing experiment $experiment_code"
  fastqc $pair_file_1 -o $experiment_dir
  fastqc $pair_file_2 -o $experiment_dir
  echo "Done!"
  

done < $DATA_DIR/fqfiles

# Quality check
#fastqc /localdisk/data/BPSM/Assingment1/fastq/*fq.gz -o
