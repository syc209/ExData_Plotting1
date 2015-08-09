setwd("C:/Users/Asus/Desktop/Data Science Coursera")

getwd()

list.files()

dataFile <- "./EDA/household_power_consumption.txt"

power <- read.table(dataFile, header=T, sep=";", na.string="?", stringsAsFactors = FALSE)

power$Date = as.Date(power$Date)

power.subset = power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"), ]

hist(as.numeric(power.subset$Global_active_power), main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red")
