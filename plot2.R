rawData <- read.table("household_power_consumption 2.txt", sep=";", header=TRUE)
cleanData <- rawData
cleanData[cleanData=='?']<-NA
cleanData$Date <- as.Date(cleanData$Date, "%d/%m/%Y")
plotData <- cleanData[cleanData$Date=="2007-02-01" | cleanData$Date=="2007-02-02",]

#plot2
t<-strptime(paste(plotData$Date, plotData$Time), "%Y-%m-%d %H:%M:%S")
plot(t, as.numeric(plotData$Global_active_power)/500, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(t, as.numeric(plotData$Global_active_power)/500)

dev.copy(png, file="plot2.png")
dev.off()

