
# Plot 1

png("plot2.png", width=480, height=480)

plot(df$DTime, df$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
