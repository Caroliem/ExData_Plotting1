x <- read.csv("household_power_consumption.txt", sep= ";")
y <- subset(x, Date == "2/2/2007" | Date == "1/2/2007")
y$Global_active_power <- as.numeric(as.character(y$Global_active_power))
y$Global_reactive_power <- as.numeric(as.character(y$Global_reactive_power))
y$Sub_metering_1 <- as.numeric(as.character(y$Sub_metering_1))
y$Sub_metering_2 <- as.numeric(as.character(y$Sub_metering_2))
y$Sub_metering_3 <- as.numeric(as.character(y$Sub_metering_3))
y$Voltage <- as.numeric(as.character(y$Voltage))
y$Date <- as.Date(y$Date, "%d/%m/%Y")
y$Time <- strptime(paste(y$Date,y$Time), "%Y-%m-%d %H:%M:%S")



png(filename ="plot4.png", bg = "white", 
    width = 480, height = 480, units = "px")
par(mfrow = c (2,2)) 
with(y, {
  plot(Time, Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "" )
  plot(Time, Voltage, type = "l", xlab = "Datetime", ylab = "Voltage")
  plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, type = "l", col = "red")
  lines(Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", pch = "-", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(Time, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime" )
} )

dev.off()