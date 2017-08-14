
# estimate memory usage

x <- 2075259
y <- 9

mem_usage <- x * y * 8 / 1000000000

# Upload, unzip and prepare dataset 

setwd("./Development/R/datasciencecoursera/Exploratory Data Analysis/1st week")

con <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(con, "power_consumption.zip")

unzip("power_consumption.zip")

if (file.exists("power_consumption.zip")) file.remove("power_consumption.zip")

dir()

df <- read.csv2("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

df$Global_active_power <- as.numeric(df$Global_active_power)

# Plot 1

png("plot1.png", width=480, height=480)

hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
