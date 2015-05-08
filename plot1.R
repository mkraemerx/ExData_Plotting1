# read data
mydata <- read.csv("../household_power_consumption.txt", sep=";", skip=66637, nrows=2880,
                   na.strings='?',
                   col.names=c("dDate", "dTime", "Global_active_power", "Global_reactive_power",
                               "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                               "Sub_metering_3"),
                   colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric")
                   )
# transform data
mydata <- transform(mydata, dDate=as.Date(dDate, "%d/%m/%Y"), dTime=strptime(paste(dDate, dTime), "%d/%m/%Y %T"))

# create file and plot to it
png(file="plot1.png")
hist(mydata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()