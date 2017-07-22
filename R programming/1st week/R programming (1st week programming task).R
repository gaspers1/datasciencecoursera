setwd("C:/Users/gasper.stanovnik/Documents/Development/R/datasciencecoursera")

list.files(path = getwd())

hw1 <- read.csv("hw1_data.csv")

variable.names(hw1)

hw1[,]

head(hw1, 2)

tail(hw1, 2)

hw1[47,]

sum(is.na(hw1[,1]))

new_hw1 <- subset(hw1, !is.na(hw1$Ozone))

mean(new_hw1$Ozone)

new_hw2 <- subset(hw1, hw1$Ozone > 31 & hw1$Temp > 90)

mean(new_hw2$Solar.R)

new_hw3 <- subset(hw1, hw1$Month == 6)

mean(new_hw3$Temp)

new_hw4 <- subset(hw1, hw1$Month == 5 & !is.na(hw1$Ozone))

max(new_hw4$Ozone)
