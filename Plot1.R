## Reading the data
data_raw <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", 
                     nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

data_raw$Date <- as.Date(data_raw$Date, format = "%d/%m/%Y")

## Subsetting the data by required dates
data <- subset(data_raw, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates to perfect format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating plot 1

hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

## Creating PNG file with plot

dev.copy(png, file = "plot1.png")
dev.off()

## Please CLEAR ALL in your screen before you run the next plot 

