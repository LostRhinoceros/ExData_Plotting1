

memory_req <- 2075259*9*8
epc <- read.table("C:/Users/nbate/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

head(epc)

epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
epc$datetime <- paste(epc$Date, epc$Time)
epc$datetime <- strptime(epc$datetime, format = "%Y-%m-%d %H:%M:%S")

with(epc, plot(datetime,Global_active_power, type = "n",xlab = "", ylab = "Global Active Power (kilowatts)"))
lines(epc$datetime,epc$Global_active_power)

dev.copy(png, file = "C:/Users/nbate/Downloads/plot2.png")
dev.off()
     