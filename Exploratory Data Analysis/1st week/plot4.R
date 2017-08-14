
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

if (file.exists("household_power_consumption.zip")) file.remove("household_power_consumption.zip")

df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

df$Global_active_power <- as.numeric(df$Global_active_power)

df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

df$Voltage <- as.numeric(df$Voltage)

df$Global_reactive_power <- as.numeric(df$Global_reactive_power)

df$Date <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot 4

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(df$Date, df$Global_active_power, type='l', ylab="Global Active Power", xlab="")

plot(df$Date, df$Voltage, type='l', ylab="Voltage", xlab="datetime")

plot(df$Date, df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(df$Date, df$Sub_metering_2, type="l", col="red")
lines(df$Date, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex = 0.75)

plot(df$Date, df$Global_reactive_power, type='l', ylab="Global reactive power", xlab="datetime")

dev.off()
