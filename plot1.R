

memory_req <- 2075259*9*8
epc <- read.table("C:/Users/nbate/Downloads/household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

head(epc)

epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

epc <- subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))


with(epc, hist(Global_active_power, col = "red", 
          xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))

dev.copy(png, file = "C:/Users/nbate/Downloads/plot1.png")
dev.off()

