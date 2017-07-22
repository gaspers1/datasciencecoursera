setwd("C:/Users/gasper.stanovnik/Documents/Development/R/datasciencecoursera")

df <- read.csv("hw1_data.csv")

x <- function(dataset, nona = TRUE) {
  for (i in dataset) {
    print(mean(i, na.rm = nona))
  }
}

x(df)

