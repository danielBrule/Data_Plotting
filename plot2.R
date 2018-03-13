setwd("C:/DataPlotting/ExData_Plotting1")

data <- read.table("household_power_consumption.txt" ,sep = ";", header = TRUE, nrows = 2075260, na.strings = "?")


data$DateTime <- paste(data$Date, data$Time, sep = "-")

data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y-%H:%M:%S")


data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))


data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))



plot(x = data$DateTime, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png" )
dev.off()