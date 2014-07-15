

wd <- "C:/Users/Renerts/Documents/datasciencecoursera"
setwd(wd)


## Q3
gas.path="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file(gas.path, "gas.xlsx")

library(xlsx)

cols <- 7:15
rows <- 18:23

dat <- read.xlsx("gas.xlsx", sheetIndex=1, colIndex=cols, rowIndex=rows)
sum(dat$Zip*dat$Ext,na.rm=T) 

## Q4

rest.path <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(rest.path, "restaurants.xml")
library(XML)

rest <- xmlTreeParse("restaurants.xml", useInternal=TRUE)
rootNode <- xmlRoot(rest)
xmlName(rootNode)
rootNode[[1]][[1]]
zipcodes <- as.factor(xpathSApply(rootNode,"//zipcode",xmlValue))
table(zipcodes)

## Q5
commun.path <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv "
download.file(commun.path, "communities.csv")

library(data.table)

DT <- fread("communities.csv")
system.time((DT[,mean(pwgtp15),by=SEX]))
a <- system.time(rowMeans(DT)[DT$SEX==1])