x <- read.csv("household_power_consumption.txt", sep= ";")
y <- subset(x, Date == "2/2/2007" | Date == "1/2/2007")
y$Sub_metering_1 <- as.numeric(as.character(y$Sub_metering_1))
y$Sub_metering_2 <- as.numeric(as.character(y$Sub_metering_2))
y$Sub_metering_3 <- as.numeric(as.character(y$Sub_metering_3))
y$Date <- as.Date(y$Date, "%d/%m/%Y")
y$Time <- strptime(paste(y$Date,y$Time), "%Y-%m-%d %H:%M:%S")


png(file =  "plot3.png", bg = "white", 
    width = 480, height = 480, units = "px")

plot(y$Time, y$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(y$Time, y$Sub_metering_2, type = "l", col = "red")
lines(y$Time,y$Sub_metering_3, type = "l", col = "blue")
legend("topright",y=max(y$Sub_metering_1), pch = "-", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()