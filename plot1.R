setwd("/home/geert/coursera/data science/04 exploratory data analysis/data")

data <- read.csv("household_power_consumption.txt", sep = ";", header= TRUE, skip = 66636, nrows = 2880, stringsAsFactors = FALSE)
columnnames <- read.csv("household_power_consumption.txt", sep=";", nrows = 1)
names(data) <- names(columnnames)
data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
