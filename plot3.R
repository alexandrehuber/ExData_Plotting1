require(lubridate)

Sys.setlocale("LC_ALL","English")

d <- read.csv("household_power_consumption.txt", sep = ";", as.is = T)

d <- d[d$Date %in% c("1/2/2007", "2/2/2007"), ]

d$DateTime <- parse_date_time(paste(d$Date, d$Time), "dmyhms")
d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)

png(filename = "plot3.png")
plot(d$DateTime, d$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
    lines(d$DateTime, d$Sub_metering_1, col = "black")
    lines(d$DateTime, d$Sub_metering_2, col = "red")
    lines(d$DateTime, d$Sub_metering_3, col = "blue")
    legend("topright", legend = names(d)[7:9], lty = 1, col = c("black", "red", "blue"))
dev.off()