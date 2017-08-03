best <- function(state, outcome) {
    ## Read outcome data
    
    outcomes <- read.csv('outcome-of-care-measures.csv', colClasses = "character")
    
    ## Check that state and outcome are valid
    options(warn=-1)
    
    outcomes[, 11] <- as.numeric(outcomes[, 11]) # heart attack
    outcomes[, 17] <- as.numeric(outcomes[, 17]) # heart failure
    outcomes[, 23] <- as.numeric(outcomes[, 23]) # pneumonia
    
    data <- c()
    
    valid <- c("heart attack", "heart failure", "pneumonia")
    
    if (!outcome %in% valid) {
        stop("invalid outcome")
    }
    
    if (!state %in% outcomes$State) {
        stop("invalid state")
    }
    
    if (outcome == "heart attack") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[11])) 
        result <- subset(outcomes, !is.na(outcomes[, 11]) & outcomes[,7] == state, select=cols)
    }
    
    if (outcome == "heart failure") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[17])) 
        result <- subset(outcomes, !is.na(outcomes[, 17]) & outcomes[,7] == state, select=cols)
    } 
    
    if (outcome == "pneumonia") {
        cols <- c(colnames(outcomes[2]), colnames(outcomes[7]), colnames(outcomes[23])) 
        result <- subset(outcomes, !is.na(outcomes[, 23]) & outcomes[,7] == state, select=cols)
    } 
    
    ## Return hospital name in that state with lowest 30-day death
    
    final <- result[which(result[3] == min(result[3])),1]
    return(final)

    
}


best("TX","heart attack")

best("TX","heart failure")

best("MD","heart attack")

best("MD","pneumonia")

best("BB","heart attack")

best("NY","hert attack")
