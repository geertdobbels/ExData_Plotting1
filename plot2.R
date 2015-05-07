setwd("/home/geert/coursera/data science/04 exploratory data analysis/data")

data <- read.csv("household_power_consumption.txt", sep = ";", header= TRUE, skip = 66636, nrows = 2880, stringsAsFactors = FALSE)
columnnames <- read.csv("household_power_consumption.txt", sep=";", nrows = 1)
names(data) <- names(columnnames)
data[,"Datetime"] <- as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
