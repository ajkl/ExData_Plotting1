rawData <- read.table("household_power_consumption 2.txt", sep=";", header=TRUE)
cleanData <- rawData
cleanData[cleanData=='?']<-NA
cleanData$Date <- as.Date(cleanData$Date, "%d/%m/%Y")
plotData <- cleanData[cleanData$Date=="2007-02-01" | cleanData$Date=="2007-02-02",]
t<-strptime(paste(plotData$Date, plotData$Time), "%Y-%m-%d %H:%M:%S")

#plot3
s1<-as.numeric(levels(plotData$Sub_metering_1))[plotData$Sub_metering_1]
s2<-as.numeric(levels(plotData$Sub_metering_2))[plotData$Sub_metering_2]
s3<-plotData$Sub_metering_3
plot(t, s1, type="n", ylab="Energy sub metering")
lines(t, s1, col="black")
lines(t, s2, col="red")
lines(t, s3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lwd=1)
