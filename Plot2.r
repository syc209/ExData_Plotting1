dataFile <- "./EDA/household_power_consumption.txt"

power <- read.table(dataFile, header=T, sep=";", na.string="?", stringsAsFactors = FALSE)

power$Date = as.Date(power$Date)

power.subset = power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"), ]

plot(power.subset$datetime, power.subset$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="Plot2.png")

dev.off()
