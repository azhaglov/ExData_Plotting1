## Reading the data
data_raw <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                     nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

data_raw$Date <- as.Date(data_raw$Date, format = "%d/%m/%Y")

## Subsetting the data by required dates
data <- subset(data_raw, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates to perfect format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 3
with(data, {plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Creating PNG file with plot

dev.copy(png, file = "plot3.png")
dev.off()

## Please CLEAR ALL in your screen before you run the next plot 
