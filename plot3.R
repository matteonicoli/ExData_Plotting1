classes <- c(rep("character",2),rep("numeric",7))
d <- read.csv2("household_power_consumption.txt", header = TRUE, 
               na.strings = "?", colClasses = classes, dec = ".")

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- subset(d, (d$Date >= "2007-02-01") & (d$Date <= "2007-02-02"))

png(filename = "plot3.png", width = 480, height = 480)

t <- strptime(paste(d$Date,as.character(d$Time)),
              format = "%Y-%m-%d %H:%M:%S")
plot(t,d$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", bg = "transparent")
lines(x = t, y = d$Sub_metering_2, col = "red", type = "l")
lines(x = t, y = d$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = names(d)[7:9], lty = 1, 
       col = c("black","red","blue"))
dev.off()
