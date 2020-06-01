consum <- read.table("household_power_consumption.txt",
                    skip = 1, sep = ";")
names(consum) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity",
                  "Sub_metering_1","Sub_metering_2","Sub_metering_3")
subconsum <- subset(consum, consum$Date=="1/2/2007" | consum$Date =="2/2/2007")
subconsum
hist(as.numeric(as.character(subconsum$Global_active_power)),col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
title(main="Global Active Power")
png("plot1.png", width=480, height=480)
dev.off()
