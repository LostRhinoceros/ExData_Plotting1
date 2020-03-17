

memory_req <- 2075259*9*8
epc <- read.table("C:/Users/nbate/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

head(epc)

epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
epc$datetime <- paste(epc$Date, epc$Time)
epc$datetime <- strptime(epc$datetime, format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(1,1), mar = c(4,4,4,4))
with(epc, plot(datetime,Global_active_power, type = "n",xlab = "", ylab = "Energy sub metering", ylim = c(0,40)))
lines(epc$datetime,epc$Sub_metering_1, col = "black")
lines(epc$datetime, epc$Sub_metering_2, col = "red")
lines(epc$datetime, epc$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = c("__","__","__"))


dev.copy(png, file = "C:/Users/nbate/Downloads/plot3.png")
dev.off()
     