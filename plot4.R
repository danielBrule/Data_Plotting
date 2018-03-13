setwd("C:/DataPlotting/ExData_Plotting1")

data <- read.table("household_power_consumption.txt" ,sep = ";", header = TRUE, nrows = 2075260, na.strings = "?")


data$DateTime <- paste(data$Date, data$Time, sep = "-")

data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y-%H:%M:%S")


data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))


data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))


par (mfrow = c(2,2))
plot(x = data$DateTime, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(x = data$DateTime, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x = data$DateTime, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lwd=c(2,2,2))


plot(x = data$DateTime, y = data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")



dev.copy(png, "plot4.png" )
dev.off()