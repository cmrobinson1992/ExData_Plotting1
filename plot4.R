#from plots 1, 2, and 3
getwd()
data <- "household_power_consumption.txt"
dataset <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataset <- dataset[(dataset$Date %in% c("1/2/2007", "2/2/2007")), ]
global_active_power <- as.numeric(dataset$Global_active_power)
png("plot1.png", width = 640, height = 640)
hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

date_time <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 640, height = 640)
plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
sub_metering_3 <- as.numeric(dataset$Sub_metering_3)
png("plot3.png", width = 640, height = 640)
plot(date_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, sub_metering_2, type = "l", col = "red")
lines(date_time, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()

#extract voltage and global_reactive_power variables from dataset
voltage <- as.numeric(dataset$Voltage)
global_reactive_power <- as.numeric(dataset$Global_reactive_power)

png("plot4.png", width = 640, height = 640)
par(mfrow = c(2,2))

#create all 4 plots in one window
plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(date_time, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(date_time, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, sub_metering_2, type = "l", col = "red")
lines(date_time, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
plot(date_time, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
