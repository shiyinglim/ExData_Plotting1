power=read.csv("household_power_consumption.txt",header=T,sep=";")
power=subset(power,power$Date=="1/2/2007" |power$Date=="2/2/2007")

power$datetime=paste(power$Date,power$Time,sep=" ")
power$datetime = strptime(x = as.character(paste(power$Date,power$Time,sep=" ")),format = "%d/%m/%Y %H:%M")
power=power[,-c(1,2)]

### Changing all factors into numeric ###
for (i in 1:(length(power)-2))
{
  power[[i]]=as.numeric(as.character(power[[i]]))
}
attach(power)

##### Plot 4 ######

##### Changing the graphics to accomodate 4 graphs in 1 #####
par(mfrow=c(2,2))

plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

plot(datetime,Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,Sub_metering_2,col="red")
lines(datetime,Sub_metering_3,col=4)
legend("topright",legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"),col=c(1,2,4),bty="n",lty=c(1,1,1),cex=0.5)

plot(datetime,Global_reactive_power,type="l")
dev.copy(png, file = "plot4.png")
dev.off()
