# script_for_LD_Crispr    


This repo presents the scripts used for processing a sequencing reads from crispr screen assay. 
the script consists of tree steps including 
- 1 grep index of samples with the mixed library 
- 2 obtain the sgRNA sequences based on INDEX+PRIMER sequences grep result . 
- 3 count the sgRNA frequnces and annotate the result with known librarys 
    
to note, as the raw count could not be directly compared, we then normalized the reads with total library and time a 10^6 allowing comparisong among samples. 

The main process steps were processed with `SeqKit` tool and `csvtk` which developed by Wei Shen


# authors 
Qi ZHao 
