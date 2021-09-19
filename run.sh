#!/bin/sh 
cat sample.txt | xargs -iF -P2 sh -c "sh count.sh F"

ls *.count |xargs -iF -P1 sh -c "Rscript normalized.R F lib.annotate_update.tsv"
