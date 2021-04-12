# JoinTSV
This script takes tsv output from stringtie and joins each gene to look like this:


| merged.ID  | LarvalCarcass | LarvalCNS
| ------------- | ------------- |-----------|
| FBgn0031208 | 2.512208  | 5.2865073 |
| FBgn0002121  | 48.918404  | 82.0454227|





If there are multiple replicates from the same sample or tissue, name them like this:  
ERR2105693.LarvalCarcass.tsv  
ERR2105694.LarvalCarcass.tsv  
ERR2105695.LarvalCarcass.tsv

The script will remove everything up to the first period and average everything with the same name before the .tsv, making one column for each gene with the average expression across replicates. If you don't want it to average replicates, name your tsv files like this:  
ERR2105693.LarvalCarcass1.tsv  
ERR2105694.LarvalCarcass2.tsv  
ERR2105695.LarvalCarcass3.tsv  

run the script as rscript jointsv.R and it will run on every .tsv file in the current directory.
