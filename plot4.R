

memory_req <- 2075259*9*8
epc <- read.table("C:/Users/nbate/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

head(epc)

epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
epc$datetime <- paste(epc$Date, epc$Time)
epc$datetime <- strptime(epc$datetime, format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2), mar = c(4,4,2,2.5))
with(epc, plot(datetime,Global_active_power, type = "n",xlab = "", ylab = "Global Active Power"))
lines(epc$datetime,epc$Global_active_power)

with(epc, plot(datetime,Voltage, type = "n"))
lines(epc$datetime,epc$Voltage)

with(epc, plot(datetime,Global_active_power, type = "n",xlab = "", ylab = "Energy sub metering", ylim = c(0,40)))
lines(epc$datetime,epc$Sub_metering_1, col = "black")
lines(epc$datetime, epc$Sub_metering_2, col = "red")
lines(epc$datetime, epc$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = c("__","__","__"), cex=0.65)

with(epc, plot(datetime, Global_reactive_power, type = "n"))
lines(epc$datetime, epc$Global_reactive_power)

dev.copy(png, file = "C:/Users/nbate/Downloads/plot4.png")
dev.off()
     