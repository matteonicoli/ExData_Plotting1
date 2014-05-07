classes <- c(rep("character",2),rep("numeric",7))
d <- read.csv2("household_power_consumption.txt", header = TRUE, 
               na.strings = "?", colClasses = classes, dec = ".")

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- subset(d, (d$Date >= "2007-02-01") & (d$Date <= "2007-02-02"))

t <- strptime(paste(d$Date,as.character(d$Time)),
              format = "%Y-%m-%d %H:%M:%S")


png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
####################################################################
plot(t,d$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", bg = "transparent")
####################################################################
plot(t,d$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", bg = "transparent")
lines(x = t, y = d$Sub_metering_2, col = "red", type = "l")
lines(x = t, y = d$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = names(d)[7:9], lty = 1, 
       col = c("black","red","blue"), bty = "n")
####################################################################
plot(t,d$Voltage, type = "l", xlab = "datetime", 
            ylab = "Voltage", bg = "transparent")
####################################################################
plot(t,d$Global_reactive_power, type = "l", xlab = "datetime", 
           ylab = "Global_reactive_power", bg = "transparent")

dev.off()
