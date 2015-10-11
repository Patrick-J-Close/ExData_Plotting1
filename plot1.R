setwd("C:/Users/Patrick Close/Documents/Courses/ExploratoryDataAnalysis/Project1")
dataFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerConsume <- dataFile[dataFile$Date %in% c("1/2/2007", "2/2/2007"), ]

#Subset Global Active Power
globalActivePower <- as.numeric(powerConsume$Global_active_power)

#Build plot
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

