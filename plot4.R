mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
mysub <- subset(mydata, mydata$Date=="1/2/2007" | mydata$Date =="2/2/2007")
mysub$DateTime = strptime( apply( mysub[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S") 
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,4,2))

plot(mysub$DateTime, mysub$Global_active_power, xlab="datetime", ylab="Global Active Power", type="l")

plot(mysub$DateTime, mysub$Voltage, ylab="Voltage", xlab="datetime", type="l")

plot(mysub$DateTime, mysub$Sub_metering_1, xlab="datetime", ylab="Energy sub metering", type="l")
lines(mysub$DateTime, mysub$Sub_metering_2, col="red", type="l")
lines(mysub$DateTime, mysub$Sub_metering_3, col="blue", type="l")
legend("topright", lty = c(1, 1, 1), col=c("black", "red", "blue"), legend=c("Submetering_1", "Submetering_2", "Submetering_3"))

plot(mysub$DateTime, mysub$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()  
