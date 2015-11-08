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

png("~/Desktop/plot3.png")
plot(mydata$newDT, mydata$Sub_metering_1, type="n", xlab= "", 
     ylab="Energy sub metering")
lines(mydata$newDT, mydata$Sub_metering_1)
lines(mydata$newDT, mydata$Sub_metering_2, col="red")
lines(mydata$newDT, mydata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty =1 ,col=c("black", "red", "blue"))
dev.off()