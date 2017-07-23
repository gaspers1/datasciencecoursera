


complete <- function(directory = "specdata", id = 1:332) {

    dirform <- paste(getwd(), "/", directory, "/", sep = "")
    
    for (i in dirform) {
        files <- list.files(i)
    }
    
    filepaths <- paste(dirform, files, sep="")
    
    comp <- c()
    
    for (i in id) {
        
        file <- read.csv(filepaths[i], header=T, sep=",")
        
        totalfile <- subset(file, file$nitrate >= 0 & file$sulfate >= 0)
        
        comp <- rbind(comp, c(i, length(totalfile$ID)))
        
    }
    
    colnames(comp) <- c("ID", "nobs")
    
    comp <- as.data.frame(comp)
    
    return(comp)
    
}




complete("specdata", c(2, 4, 8, 10, 12))

complete("specdata", 30:25)

complete("specdata", 3)