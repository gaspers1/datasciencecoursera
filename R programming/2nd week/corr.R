source("complete.R")

corr <- function(directory = "specdata", threshold = 0) {

    dirform <- paste(getwd(), "/", directory, "/", sep = "")
    
    casescomp <- complete(directory,1:332)
    
    selectcase <- subset(casescomp, casescomp$nobs >= threshold, select = ID)
    
    selectcase <- formatC(selectcase$ID, width=3, flag="0")
    
    cr <- c()

    if (length(selectcase) <= 1) {
     
           print("no selected cases above threshold")
    }
    
    else {
        
        for (i in selectcase) {    
        
            file <- read.csv(paste(dirform,i,".csv", sep=""))
        
            file <- subset(file, complete.cases(file))
        
            corr <- cor(file$sulfate, file$nitrate) 
        
            cr <- c(cr, corr)
        }
    
        return(cr)
    }
    
}



cr <- corr("specdata", 150)
head(cr)

summary(cr)

cr <- corr("specdata", 400)
head(cr)

summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

length(cr)

cr <- corr("specdata")
head(cr)

summary(cr)
