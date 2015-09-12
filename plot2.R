dat <- read.table(pipe
                  ('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                  , sep=";")

colnames(dat) <- c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering_3")

dat$datetime <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)

plot(dat$datetime, dat$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()