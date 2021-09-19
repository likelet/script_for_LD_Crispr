#!/bin/sh
barcode=$1
fastq=$2
out=$3

seqkit amplicon -F $barcode -r 40:59 -j 20 $fastq | seqkit seq -s |csvtk freq -Ht -nr > ${out}.count
