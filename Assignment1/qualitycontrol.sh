#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

while IFS= read -r line
do
  args=($line)

  experiment_code=${args[0]}
  experiment_type=${args[1]}
  pair_file_1=${args[2]}
  pair_file_2=${args[3]}

  echo $experiment_code
  echo $experiment_type
  echo $pair_file_1
  echo $pair_file_2
done < $SCRIPT_DIR/fastq/fqfiles

# Quality check
#fastqc /localdisk/data/BPSM/Assingment1/fastq/*fq.gz -o
