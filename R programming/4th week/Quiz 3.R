setwd('C:/Users/gasper.stanovnik/Documents/Development/R/datasciencecoursera/R programming/4th week/')


outcomes <- read.csv('outcome-of-care-measures.csv', colClasses = "character")

## Check that state and outcome are valid

outcomes[, 11] <- as.numeric(outcomes[, 11]) # heart attack
outcomes[, 17] <- as.numeric(outcomes[, 17]) # heart failure
outcomes[, 23] <- as.numeric(outcomes[, 23]) # pneumonia

data <- c()

outcome <- "heart attack"
state <- "MD"


if (outcome == "heart attack") {
    cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[11])) 
    result <- subset(outcomes, !is.na(outcomes[, 11]) & outcomes[,7] == state, select=cols)
}

if (state == "heart failure") {
    result <- c(outcomes[, 17])
} 

if (state == "pneumonia") {
    result <- c(outcomes[, 23])
} 

final <- result[which(result[3] == max(result[3])),1]
