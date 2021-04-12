#!/bin/env Rscript
library(plyr)
library(dplyr)

#R: join tsv:
files<-list.files(pattern="tsv")
merged<-data.frame(Gene.ID=read.delim(files[1])$Gene.ID )
merged$Gene.ID <-as.character(merged$Gene.ID)



for (i in files){
  file1<-data.frame(read.delim(i)$FPKM,read.delim(i)$Gene.ID)
  names(file1)<-c(i, "Gene.ID" )
  file1<-file1[grep(x=file1$Gene.ID, pattern="FB"),]
  file1[,1]<-as.numeric(as.character(file1[,1]))
  file1$Gene.ID<-as.character(file1$Gene.ID)
  head(file1)
  merged<-join(merged, file1, by="Gene.ID", type="left", match="first")
  print(head(merged))
  print(nrow(merged))
  merged <-distinct(merged)
  print(nrow(merged))
}

merged <-unique(merged)
merged<-merged[grep(x=merged$Gene.ID, pattern="FB"),]
head(merged)
#now get the average of columns with same tissue- non uniq
#colnames(merged)<-gsub(colnames(merged), pattern=".tsv", replacement= "" )

#colnames(merged)<-gsub(colnames(merged), pattern= "^.*\\.", replacement="" )

#now get the average of columns with same tissue-  uniq

colnames(merged)<-gsub(colnames(merged), pattern= "^.*\\.", replacement="" )


head(merged)

nms <- unique(names(merged))
means<-data.frame(merged$ID, sapply(nms[2:length(nms)], function(x)  rowMeans(merged[names(merged) %in% x])))

head(means)

write.table(means, "output.txt")


