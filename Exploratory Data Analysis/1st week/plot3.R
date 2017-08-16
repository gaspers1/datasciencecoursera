
# Plot 3

png("plot3.png", width=480, height=480)

plot(df$DTime, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$DTime, df$Sub_metering_2, type="l", col="red")
lines(df$DTime, df$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
