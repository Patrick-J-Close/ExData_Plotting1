setwd("C:/Users/Patrick Close/Documents/Courses/ExploratoryDataAnalysis/Project1")
dataFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsume <- dataFile[dataFile$Date %in% c("1/2/2007", "2/2/2007"), ]

#Subset Global Active Power
globalActivePower <- as.numeric(powerConsume$Global_active_power)
#Convert to Time/Date classes
dateTime <- strptime(paste(powerConsume$Date, powerConsume$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Build Plot
png("plot2.png", width = 480, height = 480)
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
