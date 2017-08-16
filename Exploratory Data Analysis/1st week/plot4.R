
# Plot 4

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(df$DTime, df$Global_active_power, type='l', ylab="Global Active Power", xlab="")

plot(df$DTime, df$Voltage, type='l', ylab="Voltage", xlab="datetime")

plot(df$DTime, df$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(df$DTime, df$Sub_metering_2, type="l", col="red")
lines(df$DTimee, df$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex = 0.75)

plot(df$DTime, df$Global_reactive_power, type='l', ylab="Global reactive power", xlab="datetime")

dev.off()
