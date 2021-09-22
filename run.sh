#!/bin/sh 
cat sample.txt | xargs -iF -P2 sh -c "sh count.sh F"

ls *.count |xargs -iF -P1 sh -c "Rscript normalized.R F lib.annotate_update.tsv"

# combine result 

ls *.csv | rush 'csvtk rename -f normalized -n {.} {} -o {}.csv2'

csvtk join --outer-join --na 0 -f 1-4 --infile-list <(ls *.csv2) > merge.csv
