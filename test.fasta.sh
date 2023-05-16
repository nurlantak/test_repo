#! /bin/bash
set -e | set -u | set -o pipefail

# Glob over files in the current directory 
for file in ./*.fastq
do
	echo $file
	filename=$(basename $file)
	echo $filename
	sample_name=${filename%.*}
	echo Processing $sample_name
	echo ${sample_name}.stats
	seqkit stats $file > ${sample_name}.stats
	seqtk seq -a $file > ${sample_name}.fasta
done
