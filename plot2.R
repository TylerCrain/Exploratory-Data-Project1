data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', 
                      na.strings="?",check.names=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()