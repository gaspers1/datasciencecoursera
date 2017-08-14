con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

fileloc <- "./Development/R/datasciencecoursera/Getting and Cleaning data/3rd week/"

download.file(con, paste(fileloc, "pid.csv"))
dataset <- read.csv(paste(fileloc, "pid.csv"))

agricultureLogical <- dataset$ACR == 3 & dataset$AGS == 6

head(which(agricultureLogical), 3)



con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

fileloc <- "./Development/R/datasciencecoursera/Getting and Cleaning data/3rd week/"

download.file(con, paste(fileloc, "jeff.jpg"), mode='wb')

library(jpeg)
picture <- readJPEG(paste(fileloc, "jeff.jpg"), native=TRUE)

quantile(picture, probs = c(0.3, 0.8))



con1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

con2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

fileloc <- "./Development/R/datasciencecoursera/Getting and Cleaning data/3rd week/"

download.file(con1, paste(fileloc, "FGDP.csv"), mode='wb')

download.file(con2, paste(fileloc, "FEDSTATS_Country.csv"), mode='wb')

library(data.table)

dataset1 <- fread(paste(fileloc, "FGDP.csv"), header=F, skip=5, select = c(1,2,4,5), col.names = c("CountryCode","CID","Economy","USD"), nrow=190)
    
dataset2 <- fread(paste(fileloc, "FEDSTATS_Country.csv"))

dataset <- merge(dataset1, dataset2, by = "CountryCode")

nrow(dataset)

ort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?

dataset <- setorderv(dataset, cols = "CID", order=-1)

dataset$Economy[13]


dataset[`Income Group` == "High income: OECD"
        , lapply(.SD, mean)
        , .SDcols = c("CID")
        , by = "Income Group"]

dataset[`Income Group` == "High income: nonOECD"
        , lapply(.SD, mean)
        , .SDcols = c("CID")
        , by = "Income Group"]




breaks <- quantile(dataset[, CID], probs = seq(0, 1, 0.2), na.rm = TRUE)
dataset$qGDP <- cut(dataset[, CID], breaks = breaks)
dataset[`Income Group` == "Lower middle income", .N, by = c("Income Group", "qGDP")]
