
# estimate memory usage

print(paste(round(2075259 * 9 * 8 / 1000000, 1), "MB"))

print(object.size(df), units = "auto", standard = "SI") 
print(object.size(df), units = "auto", standard = "IEC")

# Upload, unzip and prepare dataset 

setwd("./Development/R/Exploratory Data Analysis")

con <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(con, "power_consumption.zip")
unzip("power_consumption.zip")

df <- read.csv2("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

if (file.exists("power_consumption.zip")) file.remove("power_consumption.zip")
if (file.exists("household_power_consumption.txt")) file.remove("household_power_consumption.txt")

# Prepare data (subset and set numeric variables)

Sys.setlocale("LC_TIME", "English") # Set local time to English for current session

df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
df$DTime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

for (i in 3:9) {
    df[,i] <- as.numeric(df[,i]) # Set all other variables as numeric
}

# Plot 1

png("plot1.png", width=480, height=480)

hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
