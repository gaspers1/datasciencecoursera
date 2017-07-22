


pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {

    dirform <- paste(getwd(), "/", directory, "/", sep = "")
    
    for (i in dirform) {
        files <- list.files(i)
    }
    
    filepaths <- paste(dirform, files, sep="")

    for (i in id) {
    
        file <- read.csv(filepaths[i], header=T, sep=",")
        
        totalfile <- rbind(totalfile, subset(file, select = pollutant))
    
    }
    
    if (pollutant == "nitrate") {
        pollmean <- totalfile$nitrate }
    else {
        pollmean <- totalfile$sulfate    
    }
        
    print(mean(pollmean, na.rm = TRUE))
  
}