rankhospital("NC", "heart attack", "worst")rankhospital <- function(state, outcome, rank) {
    
    ## Read outcome data
    
    outcomes <- read.csv('outcome-of-care-measures.csv', colClasses = "character")
    
    ## Check that state and outcome are valid
    
    options(warn=-1)
    
    outcomes[, 11] <- as.numeric(outcomes[, 11]) # heart attack
    outcomes[, 17] <- as.numeric(outcomes[, 17]) # heart failure
    outcomes[, 23] <- as.numeric(outcomes[, 23]) # pneumonia
    
    
    valid <- c("heart attack", "heart failure", "pneumonia")
    
    if (!outcome %in% valid) {
        stop("invalid outcome")
    }
    
    if (!state %in% outcomes$State) {
        stop("invalid state")
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    if (outcome == "heart attack") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[11])) 
        result <- subset(outcomes, !is.na(outcomes[, 11]) & outcomes[,7] == state, select=cols)
        result <- result[order(result[,3], result[,1]),]
        result$rank <- rank(result[,3], ties.method="first")
    }
    
    if (outcome == "heart failure") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[17])) 
        result <- subset(outcomes, !is.na(outcomes[, 17]) & outcomes[,7] == state, select=cols)
        result <- result[order(result[,3], result[,1]),]
        result$rank <- rank(result[,3], ties.method="first")
    } 
    
    if (outcome == "pneumonia") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[23])) 
        result <- subset(outcomes, !is.na(outcomes[, 23]) & outcomes[,7] == state, select=cols)
        result <- result[order(result[,3], result[,1]),]
        result$rank <- rank(result[,3], ties.method="first")
    } 
    
    if (rank == "best") {
        rank <- 1
    }
    if (rank == "worst") {
        rank <- length(result[,4])
    }
    if (rank > length(result[,4])) {
        stop("NA")
    }
    
    return(result[which(result[4] == rank),1])
    
}


rankhospital("TX", "heart failure", 4)

rankhospital("MD", "heart attack", "worst")

rankhospital("MN", "heart attack", 5000)

