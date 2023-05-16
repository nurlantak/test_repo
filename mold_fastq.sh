#! /bin/bash
set -e
set -u
set -o pipefail
#KEEP COOL
#populate array usinf loop construct
i=0
sample_array=() #create an empty array

for file in *R?.fastq
do 
	filename=$(basename $file)
	sample_name=${filename%.*}
	sample_name=${sample_name%_*} #remove suffiz starting with _
	sample_array[$i]=$sample_name
	i=$((i+1))
done
echo ${sample_array[@]} #print array

for sample in ${sample_array[@]} #iterate over the array
do 
	./interleave_fastq.sh ${sample}_R1.fastq ${sample}_R2.fastq > ${sample}_interleaved.fastq
done
