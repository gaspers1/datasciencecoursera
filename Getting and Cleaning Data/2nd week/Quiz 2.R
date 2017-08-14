library(httr)
require(httpuv)
require(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("2nd week", "5da56b71e743e050ba20", secret="2c8525d5562b41acc2e2c74c559d2fc343fd6c14")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
list(output[[11]]$name, output[[11]]$created_at)




library(sqldf)

con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
file <- "./Development/R/datasciencecoursera/Getting and Cleaning Data/2nd week/pid.csv"

download.file(con, file)

dataset <- read.csv(file)
q1 <- sqldf("select * from dataset where AGEP < 50")
q2 <- sqldf("select * from dataset")
q3 <- sqldf("select pwgtp1 from dataset where AGEP < 50")
q4 <- sqldf("select pwgtp1 from dataset")





unique(dataset$AGEP)
sqldf("select unique * from dataset")
sqldf("select AGEP where unique from dataset")
sqldf("select distinct pwgtp1 from dataset")
sqldf("select distinct AGEP from dataset")






connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(connection)
close(connection)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))



url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n=10)
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
d <- read.fwf(url, w, header=FALSE, skip=4, col.names=colNames)
d <- d[, grep("^[^filler]", names(d))]
sum(d[, 4])
