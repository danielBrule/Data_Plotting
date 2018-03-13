setwd("C:/DataPlotting/ExData_Plotting1")

data <- read.table("household_power_consumption.txt" ,sep = ";", header = TRUE, nrows = 2075260, na.strings = "?")


data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))

data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(data$Global_active_power, col = "red" ,xlab = "Global Active Power (kilowatts)", breaks = 13, xlim = c(0,6))

dev.copy(png, "plot1.png" )
dev.off()