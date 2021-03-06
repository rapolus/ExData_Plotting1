dat <- read.table(pipe
                  ('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                  , sep=";")

colnames(dat) <- c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering_3")

dat$datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(dat$datetime, dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(dat$datetime, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dat$datetime, dat$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy Submetering")
lines(dat$datetime, dat$Sub_metering_2, type = "l", col ="red")
lines(dat$datetime, dat$Sub_metering_3, type = "l", col ="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dat$datetime, dat$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()