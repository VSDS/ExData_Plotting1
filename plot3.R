##Coursera Exploratory Data Analysis - Assignment 1 - Plot 3

## Read data  
homePowerConsumptionData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, fill=TRUE)

## Format date
homePowerConsumptionData$Date <- as.Date(homePowerConsumptionData$Date, format("%d/%m/%Y"))

## Get only data required
subsetPowerConsumptionData <- subset(homePowerConsumptionData, subset=((Date=="2007-02-01") | (Date == "2007-02-02")))
rownames(subsetPowerConsumptionData) <- NULL


##Get the data ready
powerConsumptionDateTime <- paste(subsetPowerConsumptionData$Date,subsetPowerConsumptionData$Time, sep=" ")
powerConsumptionDateTime <- as.POSIXct(powerConsumptionDateTime)
subMetering1 <- as.numeric(subsetPowerConsumptionData$Sub_metering_1)
subMetering2 <- as.numeric(subsetPowerConsumptionData$Sub_metering_2)
subMetering3 <- as.numeric(subsetPowerConsumptionData$Sub_metering_3)

## Plot the details
plot(powerConsumptionDateTime, subMetering1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(powerConsumptionDateTime, subMetering2, type="l", col="red") 
lines(powerConsumptionDateTime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), y.intersp=1, xjust=0.5) 

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()


