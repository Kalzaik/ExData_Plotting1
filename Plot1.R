#importing the data
data <- read.delim("household_power_consumption.txt", header=TRUE, sep=";")
#change data date class
data <- transform(data, Date = as.Date(Date,"%d/%m/%Y"))
#subsetting data from 2007-02-01 to 2007-02-02
dataInterest <- subset(data, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"),)
#plot data
par(mfcol=c(1,1))
hist(as.numeric(dataInterest$Global_active_power), col="red", xlab="Global Active Power (kilowatts", main="Global Active Power")
#copy data to png
dev.copy(png, file="plot1.png")
dev.off()
