#from plot1
getwd()
data <- "household_power_consumption.txt"
dataset <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dataset <- dataset[(dataset$Date %in% c("1/2/2007", "2/2/2007")), ]
global_active_power <- as.numeric(dataset$Global_active_power)

#combine date and time variables
date_time <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create plot
png("plot2.png", width = 640, height = 640)
plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
