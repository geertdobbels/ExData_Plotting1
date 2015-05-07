setwd("/home/geert/coursera/data science/04 exploratory data analysis/data")

data <- read.csv("household_power_consumption.txt", sep = ";", header= TRUE, skip = 66636, nrows = 2880, stringsAsFactors = FALSE)
columnnames <- read.csv("household_power_consumption.txt", sep=";", nrows = 1)
names(data) <- names(columnnames)
data[,"Datetime"] <- as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")


png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$Datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$Datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = c(1,1,1))
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
