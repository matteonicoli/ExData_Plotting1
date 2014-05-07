classes <- c(rep("character",2),rep("numeric",7))
d <- read.csv2("household_power_consumption.txt", header = TRUE, 
               na.strings = "?", colClasses = classes, dec = ".")

d$Date <- as.Date(d$Date, format = "%d/%m/%Y")
d <- subset(d, (d$Date >= "2007-02-01") & (d$Date <= "2007-02-02"))

png(filename = "plot2.png", width = 480, height = 480)

t <- strptime(paste(d$Date,as.character(d$Time)),
              format = "%Y-%m-%d %H:%M:%S")
plot(t,d$Global_active_power, type = "l", xlab = "", 
        ylab = "Global Active Power (kilowatts)", bg = "transparent")

dev.off()
