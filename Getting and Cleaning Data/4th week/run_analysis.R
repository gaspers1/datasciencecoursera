
library(dplyr)
library(data.table)


# 1. Download the data, unzip, remove zipped file and check files in folder

con <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

setwd("./Development/R/datasciencecoursera/Getting and Cleaning data/4th week")

download.file(con, "ds.zip")

unzip("ds.zip", exdir=".")

file.remove("ds.zip")

setwd("./UCI HAR Dataset")

dir()


# import all tables for merge within df

features <- read.table("features.txt", colClasses = "character")

activities <- read.table("activity_labels.txt")

colnames(activities) <- c("actId", "actLabel")

df_train <- fread("./train/X_train.txt")
labels_train <- fread("./train/y_train.txt")
subject_train <- fread("./train/subject_train.txt")

df_test <- fread("./test/X_test.txt")
labels_test <- fread("./test/y_test.txt")
subject_test <- fread("./test/subject_test.txt")

# merge both tables - train and test

train <- cbind(subject_train, labels_train, df_train)
test <- cbind(subject_test, labels_test, df_test)

df <- as.data.frame(rbind(train, test))


# append labels

colnames(df) <- c("subject", "activity", features[, 2])

keep <- grepl("subject|activity|mean|std", colnames(df))

df <- df[, keep]

df$activity <- factor(df$activity, levels = activities[, 1], labels = activities[, 2])



dfcols <- colnames(df)

# replace all short names with descriptive var names

dfcols <- gsub("[\\(\\)-]", "", dfcols)

dfcols <- gsub("^f", "fre", dfcols)
dfcols <- gsub("^t", "time", dfcols)
dfcols <- gsub("Acc", "Accelerometer", dfcols)
dfcols <- gsub("Gyro", "Gyroscope", dfcols)
dfcols <- gsub("Mag", "Magnitude", dfcols)
dfcols <- gsub("Freq", "Frequency", dfcols)
dfcols <- gsub("mean", "Mean", dfcols)
dfcols <- gsub("std", "StdDev", dfcols)
dfcols <- gsub("BodyBody", "Body", dfcols)

colnames(df) <- dfcols



# aggregate means in whole dataset by subject and activity

dfMeans <- df %>% 
    group_by(subject, activity) %>%
    summarise_all(funs(mean))

colnames(dfMeans)

# output to file 

write.table(dfMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)
