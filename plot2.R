mydata <-
  read.csv("~/Desktop/household_power_consumption.txt", na.strings = "?", 
           sep = ";", skip = 62000, nrows = 8000)

names(mydata) <-
  c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

mydata <- subset(mydata, Date=="1/2/2007" | Date=="2/2/2007")

mydata$newDate <- strptime(as.character(mydata$Date), "%d/%m/%Y")
mydata$newDT <- paste(mydata$newDate, mydata$Time)
mydata$newDT <- as.POSIXlt(mydata$newDT)

png ("~/Desktop/plot2.png")
plot(mydata$newDT, mydata$Global_active_power, type='n', xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(mydata$newDT, mydata$Global_active_power)
dev.off()