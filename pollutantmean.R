pollutantmean <- function(directory, pollutant, id) {
        mean.list <- vector('numeric', length=length(id))
        for (i in id) {
                if(nchar(id[i])==1) {
                        print(path <- paste(directory,'00',id,'.csv',sep=""))
                }else if(nchar(id[i])==2) {
                        print(path <- paste(directory,'0',id,'.csv',sep=""))
                }else if(nchar(id[i])==3) {
                        print(path <- paste(directory,id,'.csv',sep=""))
                }
#                 file <- read.csv(path)
#                 mean.list[i] <- mean(file[[pollutant]], na.rm=T)
        }
#         mean.all <- mean(mean.list)
        return(mean.list)
}