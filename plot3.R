setwd("C:/Users/Patrick Close/Documents/Courses/ExploratoryDataAnalysis/Project1")
dataFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsume <- dataFile[dataFile$Date %in% c("1/2/2007", "2/2/2007"), ]

#Subset Global Active Power
globalActivePower <- as.numeric(powerConsume$Global_active_power)
#Convert to Time/Date classes
dateTime <- strptime(paste(powerConsume$Date, powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#Subset Sub_metering_i variables
Submetering1 <- as.numeric(powerConsume$Sub_metering_1)
Submetering2 <- as.numeric(powerConsume$Sub_metering_2)
Submetering3 <- as.numeric(powerConsume$Sub_metering_3)

#Build plot
png("plot3.png", width = 480, height = 480)
plot(dateTime, Submetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTime, Submetering2, type = "l", col = "red")
lines(dateTime, Submetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()