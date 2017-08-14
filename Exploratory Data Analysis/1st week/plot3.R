
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

df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

df$Date <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot 3

png("plot3.png", width=480, height=480)

plot(df$Date, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$Date, df$Sub_metering_2, type="l", col="red")
lines(df$Date, df$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
