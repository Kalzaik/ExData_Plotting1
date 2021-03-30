#load data
data <- read.delim("household_power_consumption.txt", header=TRUE, sep=";")
#transform data date
data <- transform(data, Date = as.Date(Date,"%d/%m/%Y"))
#subsetting data from 2007-02-01 to 2007-02-02
dataInterest <- subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"),)
#transform to date and time
dataInterest <- transform(dataInterest, Date = strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"))
#plot the data
par(mfcol=c(2,2))
plot(dataInterest$Date, dataInterest$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(dataInterest$Date, dataInterest$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataInterest$Date, dataInterest$Sub_metering_2, col="red")
lines(dataInterest$Date, dataInterest$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1), col=c("black","red","blue"), cex=0.6)
plot(dataInterest$Date, dataInterest$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dataInterest$Date, dataInterest$Global_reactive_power, type="l", xlab="datetime", ylab="Clobal_reactive_power")
#save data as PNG
dev.copy(png, file="plot4.png")
dev.off()
