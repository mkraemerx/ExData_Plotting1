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
mydata <- transform(mydata, dDate=as.Date(dDate, "%d/%m/%Y"),
                    dTime=strptime(paste(dDate, dTime), "%d/%m/%Y %T"))

# create file and plot to it
png(file="plot4.png")
par(mfrow = c(2, 2))

#top left
with(mydata, plot(dTime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(mydata, lines(dTime, Global_active_power))

#top right
with(mydata, plot(dTime, Voltage, type="n", xlab="datetime"))
with(mydata, lines(dTime, Voltage))

#bottom left
with(mydata, plot(dTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(mydata, lines(dTime, Sub_metering_1, col="black"))
with(mydata, lines(dTime, Sub_metering_2, col="red"))
with(mydata, lines(dTime, Sub_metering_3, col="blue"))
legend("topright", lwd=1, bty="n", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#bottom right
with(mydata, plot(dTime, Global_reactive_power, type="n", xlab="datetime"))
with(mydata, lines(dTime, Global_reactive_power))

dev.off()