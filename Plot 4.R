file <-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
file <- na.omit(file)
library(dplyr)
file <- tbl_df(file)
feb <- filter(file, Date == "1/2/2007" | Date == "2/2/2007")
feb$DT <- paste(feb$Date, feb$Time)
feb$DT <- strptime(feb$DT, "%d/%m/%Y%H:%M:%S")
par(mfcol = c(2, 2))
plot1 <- with(feb, plot(DT, Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)"))
plot2 <-  with(feb, plot(DT, Sub_metering_1, ylab = "Energy sub metering", type = "l"))
with(feb, lines(DT, Sub_metering_2, col = "red", type = "l"))
with(feb, lines(DT, Sub_metering_3, col = "blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")
plot3 <- with(feb, plot(DT, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
plot4 <- with(feb, plot(DT, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
