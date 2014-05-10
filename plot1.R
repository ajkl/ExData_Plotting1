rawData <- read.table("household_power_consumption 2.txt", sep=";", header=TRUE)
cleanData <- rawData
cleanData[cleanData=='?']<-NA
cleanData$Date <- as.Date(cleanData$Date, "%d/%m/%Y")
plotData <- cleanData[cleanData$Date=="2007-02-01" | cleanData$Date=="2007-02-02",]

#plot1
hist(as.numeric(plotData$Global_active_power)/500, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
