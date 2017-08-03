setwd('C:/Users/gasper.stanovnik/Documents/Development/R/datasciencecoursera/R programming/4th week')

hospitalnames <- read.csv('hospital-data.csv')

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

outcome[, 11] <- as.numeric(outcome[, 11])

hist(outcome[, 11])
