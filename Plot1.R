x <- read.csv("household_power_consumption.txt", sep= ";")
y <- subset(x, Date == "2/2/2007" | Date == "1/2/2007")
y$Global_active_power <- as.numeric(as.character(y$Global_active_power))
hist(y$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, file =  "plot1.png", 
         width = 480, height = 480, units = "px")
dev.off()