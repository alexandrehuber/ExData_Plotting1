Sys.setlocale("LC_ALL","English")

d <- read.csv("household_power_consumption.txt", sep = ";", as.is = T)

d <- d[d$Date %in% c("1/2/2007", "2/2/2007"), ]

d$Global_active_power <- as.numeric(d$Global_active_power)

png(filename = "plot1.png")
hist(d$Global_active_power, breaks = 15, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()