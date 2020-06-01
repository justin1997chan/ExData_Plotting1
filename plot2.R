consum <- read.table("household_power_consumption.txt",
                     skip = 1, sep = ";", na.strings="?")
names(consum) <- c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity",
                   "Sub_metering_1","Sub_metering_2","Sub_metering_3")
subconsum <- subset(consum, consum$Date=="1/2/2007" | consum$Date =="2/2/2007")
# convert to date format
subconsum$Date <- as.Date(subconsum$Date, format="%d/%m/%Y")
# combine date and time 
datetime <- paste(as.Date(subconsum$Date), subconsum$Time)
subconsum$datetime <- as.POSIXct(datetime)

with(subconsum, {
  plot(Global_active_power ~ datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
