#load data
data <- read.delim("household_power_consumption.txt", header=TRUE, sep=";")
#transform data date
data <- transform(data, Date = as.Date(Date,"%d/%m/%Y"))
#subsetting data from 2007-02-01 to 2007-02-02
dataInterest <- subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"),)
#transform to date and time
dataInterest <- transform(dataInterest, Date = strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"))
#plot the data
par(mfcol=c(1,1))
plot(dataInterest$Date, dataInterest$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#save data as PNG
dev.copy(png, file="plot2.png")
dev.off()
