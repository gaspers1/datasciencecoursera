getwd()

setwd('./Development/R/datasciencecoursera/Getting and Cleaning Data/4th week/')

# Question 1

con = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'

download.file(con, "dataset.csv")

df <- read.csv("dataset.csv")

if (file.exists("dataset.csv")) file.remove("dataset.csv")

apply(df$wgtp, 1, strsplit(df$wgtp, c("wgtp")))

varNamesSplit <- strsplit(colnames(df), "wgtp")

varNamesSplit[[123]]


# Question 2

con = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'

download.file(con, "dataset.csv")

df <- read.csv("dataset.csv", skip = 4, nrows = 215, stringsAsFactors = FALSE)

if (file.exists("dataset.csv")) file.remove("dataset.csv")

df <- df["X" != ""]
df <- df[, c("X", "X.1", "X.3", "X.4")]

x <- mean(as.numeric(gsub(",", "", df$X.4)), na.rm=T)

x

# Question 3

colnames(df)[1] <- "countryNames"

howmuch1 <- grepl("^United",df$countryNames)

summary(howmuch1)


# Question 4


con = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'

download.file(con, "dataset1.csv")

df1 <- read.csv("dataset.csv", skip = 4, nrows = 190, stringsAsFactors = FALSE)

df1 <- df1[, c("X", "X.1", "X.3", "X.4")]

colnames(df1)[1] <- "CountryCode"

con = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'

download.file(con, "dataset2.csv")

df2 <- read.csv("dataset2.csv")

if (file.exists("dataset1.csv")) file.remove("dataset1.csv")
if (file.exists("dataset2.csv")) file.remove("dataset2.csv")

df <- merge(df1, df2, by="CountryCode")

isFiscalYearEnd <- grepl("fiscal year end", tolower(df$Special.Notes))
isJune <- grepl("june", tolower(df$Special.Notes))
table(isFiscalYearEnd, isJune)


# Question 5

library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)

sampleTimes = index(amzn)

table(year(sampleTimes), weekdays(sampleTimes))

