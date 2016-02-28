##Coursera Exploratory Data Analysis - Assignment 1 - Plot 2

## Read data  
homePowerConsumptionData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, fill=TRUE)

## Format date
homePowerConsumptionData$Date <- as.Date(homePowerConsumptionData$Date, format("%d/%m/%Y"))
## Get only data required
subsetPowerConsumptionData <- subset(homePowerConsumptionData, subset=((Date=="2007-02-01") | (Date == "2007-02-02")))
rownames(subsetPowerConsumptionData) <- NULL


##Get data ready
globalActivePower <- as.numeric(subsetPowerConsumptionData$Global_active_power)
powerConsumptionDateTime <- paste(subsetPowerConsumptionData$Date,subsetPowerConsumptionData$Time, sep=" ")
powerConsumptionDateTime <- as.POSIXct(powerConsumptionDateTime)

## Plot the details
plot(powerConsumptionDateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()


