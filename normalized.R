library(data.table)
args = commandArgs(trailingOnly=TRUE)
# read count file and annotation file  
# 1 is count file and 2nd is annotation file 
count<-fread(args[1])
anno<-fread(args[2])

combine<-merge(anno,count,by.x="Target sequence",by.y="V1")

lib.size<-sum(combine$V2)
print(paste("overlap reads count is ",lib.size))
print(paste("unmapped reads count is ", sum(count$V2)))

# get normalized score 
combine$normalized=combine$V2/lib.size*10^6

# rename columns 
setnames(combine,c(names(combine)[1:4],"count","normalized"))

# sort by normalized count 
combine<-combine[rev(order(normalized))]

# save 
out.name<-paste(stringr::str_replace(args[1],".count",""),".csv",sep="")
write.csv(combine,file=out.name)
