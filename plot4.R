##Coursera Exploratory Data Analysis - Assignment 1 - Plot 4

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
globalActivePower <- as.numeric(subsetPowerConsumptionData$Global_active_power)
globalReactivePower <- as.numeric(subsetPowerConsumptionData$Global_reactive_power)
voltage <- as.numeric(subsetPowerConsumptionData$Voltage)
subMetering1 <- as.numeric(subsetPowerConsumptionData$Sub_metering_1)
subMetering2 <- as.numeric(subsetPowerConsumptionData$Sub_metering_2)
subMetering3 <- as.numeric(subsetPowerConsumptionData$Sub_metering_3)

## Plot the details
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,0)) 

plot(powerConsumptionDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(powerConsumptionDateTime, voltage, type="l", xlab="", ylab="Voltage")

plot(powerConsumptionDateTime, subMetering1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(powerConsumptionDateTime, subMetering2, type="l", col="red") 
lines(powerConsumptionDateTime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"),  y.intersp=1, xjust = 1, bty="n") 

plot(powerConsumptionDateTime, globalReactivePower, type="l", xlab="", ylab="Global Reactive Power")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()


