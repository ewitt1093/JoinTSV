# JoinTSV
This script takes tsv output from stringtie and joins each gene to look like this:
    merged.ID LarvalCarcass  LarvalCNS LarvalFatBody LarvalHindgut LarvalMidgut
2 FBgn0031208      2.512208  5.2865073     1.3977763     3.9850687    1.6546000
3 FBgn0002121     48.918404 82.0454227    18.1672007    94.6473617   80.8328983
6 FBgn0031209      1.019847  0.4985237     0.2625807     1.4706023    2.7801973
7 FBgn0263584      1.061928  0.8099693     0.2821100     1.8556453    2.5903807
8 FBgn0051973     11.087024  2.4007167     0.5441487     1.0177787    5.1989867
9 FBgn0267987      2.284133  1.4978423     0.1847700     0.8616523    0.7001157

If there are multiple replicates from the same sample or tissue, name them like this:
ERR2105693.LarvalCarcass.tsv
ERR2105694.LarvalCarcass.tsv
ERR2105695.LarvalCarcass.tsv

The script will remove everything up to the first period and average everything with the same name before the .tsv, making one column for each gene with the average expression across replicates. If you don't want it to average replicates, name your tsv files like this:
ERR2105693.LarvalCarcass1.tsv
ERR2105694.LarvalCarcass2.tsv
ERR2105695.LarvalCarcass3.tsv
