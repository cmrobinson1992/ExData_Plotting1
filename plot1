#see current working directory
getwd()
[1] "/Users/cmryankees19/Downloads"

#create subsetted dataset with only data from 2/1/2007 and 2/2/2007
> data <- "household_power_consumption.txt"
> dataset <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
> dataset <- dataset[(dataset$Date %in% c("2/1/2007", "2/2/2007")), ]

#create histogram of global active power
> global_active_power <- as.numeric(dataset$Global_active_power)
> png("plot1.png", width = 640, height = 640)
> hist(global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
> dev.off()
