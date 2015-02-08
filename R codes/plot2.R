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

##### Plot 2 ######
plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()