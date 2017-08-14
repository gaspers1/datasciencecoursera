getwd()

setwd('./Development/R/datasciencecoursera/Getting and Cleaning Data/4th week/')

con = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'

download.file(con, getwd())

