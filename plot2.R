require(lubridate)

Sys.setlocale("LC_ALL","English")

d <- read.csv("household_power_consumption.txt", sep = ";", as.is = T)

d <- d[d$Date %in% c("1/2/2007", "2/2/2007"), ]

d$DateTime <- parse_date_time(paste(d$Date, d$Time), "dmyhms")
d$Global_active_power <- as.numeric(d$Global_active_power)

png(filename = "plot2.png")
plot(d$DateTime, d$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()