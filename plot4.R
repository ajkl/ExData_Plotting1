rawData <- read.table("household_power_consumption 2.txt", sep=";", header=TRUE)
cleanData <- rawData
cleanData[cleanData=='?']<-NA
cleanData$Date <- as.Date(cleanData$Date, "%d/%m/%Y")
plotData <- cleanData[cleanData$Date=="2007-02-01" | cleanData$Date=="2007-02-02",]
t<-strptime(paste(plotData$Date, plotData$Time), "%Y-%m-%d %H:%M:%S")

#plot4

#topright
v<-as.numeric(levels(plotData$Voltage))[plotData$Voltage]
plot(t, v, type="n", xlab="datetime", ylab="Voltage")
lines(t, v)

#bottomright
grp<-as.numeric(levels(plotData$Global_reactive_power))[plotData$Global_reactive_power]
plot(t, grp, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(t, grp)
