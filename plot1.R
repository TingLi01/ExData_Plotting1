mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
mysub <- subset(mydata, mydata$Date=="1/2/2007" | mydata$Date =="2/2/2007")
png(filename = "plot1.png", width = 480, height = 480)
hist(mysub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()  
