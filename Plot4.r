dataFile <- "./EDA/household_power_consumption.txt"

power <- read.table(dataFile, header=T, sep=";", na.string="?", stringsAsFactors = FALSE)

power$Date = as.Date(power$Date)

power.subset = power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"), ]

par(mfrow = c(2,2), cex=.6)

with(power.subset, {
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type="l")
  plot(power.subset$datetime, power.subset$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  lines(power.subset$datetime, power.subset$Sub_metering_1)
  lines(power.subset$datetime, power.subset$Sub_metering_2, col="red")
  lines(power.subset$datetime, power.subset$Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
  plot(datetime, Global_reactive_power, type="l", ylim=c(0.0, 0.5))
})

dev.copy(png, file="Plot4.png")

dev.off()
