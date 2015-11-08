mydata <-
  read.csv("~/Desktop/household_power_consumption.txt", na.strings = "?", 
           sep = ";", skip = 62000, nrows = 8000)

names(mydata) <-
  c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

mydata <- subset(mydata, Date=="1/2/2007" | Date=="2/2/2007")

png("~/Desktop/plot1.png")

hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")

dev.off()