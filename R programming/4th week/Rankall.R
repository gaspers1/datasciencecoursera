rankall <- function(outcome, num = 1) {
    
    ## Read outcome data
    
    outcomes <- read.csv('outcome-of-care-measures.csv', colClasses = "character")
    
    ## Check that state and outcome are valid
    
    options(warn=-1)
    
    outcomes[, 11] <- as.numeric(outcomes[, 11]) # heart attack
    outcomes[, 17] <- as.numeric(outcomes[, 17]) # heart failure
    outcomes[, 23] <- as.numeric(outcomes[, 23]) # pneumonia
    
    cols2 <- c(colnames(outcomes[2]), colnames(outcomes[7]))
    valid <- c("heart attack", "heart failure", "pneumonia")
    
    if (!outcome %in% valid) {
        stop("invalid outcome")
    }
    
    checker <- function(n = num) {
        if (num == "worst") {num <<- max(result$rank)}
        if (num == "best") {num <<- 1}
        if (num > max(result$rank)) {stop("NA")}
    }
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    if (outcome == "heart attack") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[11])) 
        result <- subset(outcomes, outcomes = "heart attack", select=cols)
        result$rank <- ave(result[,3], result[,2], FUN= function(x) rank(x, ties.method = "first"))
        checker(num)
        result <- result[order(result[,2], result[,4]),]
        resultranks <- subset(result, result[,4] == num, select=cols2)
    }    
    
    if (outcome == "heart failure") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[17])) 
        result <- subset(outcomes, outcomes = "heart failure", select=cols)
        result$rank <- ave(result[,3], result[,2], FUN= function(x) rank(x, ties.method = "first"))
        checker(num)
        result <- result[order(result[,2], result[,4]),]
        resultranks <- subset(result, result[,4] == num, select=cols2)
    }    
    
    if (outcome == "pneumonia") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[23])) 
        result <- subset(outcomes, outcomes = "pneumonia", select=cols)
        result$rank <- ave(result[,3], result[,2], FUN= function(x) rank(x, ties.method = "first"))
        checker(num)
        result <- result[order(result[,2], result[,4]),]
        resultranks <- subset(result, result[,4] == num, select=cols2)
    }    
    
    return(resultranks)
}
    
## test results    


head(rankall("heart attack", 20), 10)

tail(rankall("pneumonia", "worst"), 3)

tail(rankall("heart failure"), 10)

