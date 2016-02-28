##Coursera Exploratory Data Analysis - Assignment 1 - Plot 1

## Read data  
homePowerConsumptionData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, fill=TRUE)

## Format date
homePowerConsumptionData$Date <- as.Date(homePowerConsumptionData$Date, format("%d/%m/%Y"))

## Get only data required
subsetPowerConsumptionData <- subset(homePowerConsumptionData, subset=((Date=="2007-02-01") | (Date == "2007-02-02")))
rownames(subsetPowerConsumptionData) <- NULL


##Get the data ready
globalActivePower <- as.numeric(subsetPowerConsumptionData$Global_active_power)

##Plot histogram
hist(globalActivePower, col="Red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", ylab="Frequency")
dev.copy(png,"plot1.png", height=480, width=480)
dev.off()


