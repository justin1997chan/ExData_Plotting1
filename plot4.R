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

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subconsum, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global_reactive_power",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
