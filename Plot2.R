x <- read.csv("household_power_consumption.txt", sep= ";")
y <- subset(x, Date == "2/2/2007" | Date == "1/2/2007")
y$Global_active_power <- as.numeric(as.character(y$Global_active_power))
y$Date <- as.Date(y$Date, "%d/%m/%Y")
y$Time <- strptime(paste(y$Date,y$Time), "%Y-%m-%d %H:%M:%S")
plot(y$Time, y$Global_active_power, type = "l", ylab = "Global active power (kilowatts)", xlab = "" )
dev.copy(png, file =  "plot2.png",
         width = 480, height = 480, units = "px")
dev.off()

