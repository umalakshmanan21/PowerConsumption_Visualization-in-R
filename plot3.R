powerconsumption<-read.table("household_power_consumption.txt",sep=";", header=T)
powerconsumption <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007"),] 
powerconsumption$combField <- paste0(powerconsumption$Date," " ,powerconsumption$Time)
powerconsumption$combField
powerconsumption$combField <- strptime(powerconsumption$combField, "%d/%m/%Y %H:%M:%S")
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)

png(file = "plot3.png")
plot(powerconsumption$combField,powerconsumption$Sub_metering_1,type='n',ylim=range(0:35),ylab="",xlab="")
lines(powerconsumption$combField, powerconsumption$Sub_metering_1,type='l', col='black')
lines(powerconsumption$combField, powerconsumption$Sub_metering_2,type='l', col='red')
lines(powerconsumption$combField, powerconsumption$Sub_metering_3,type='l', col='blue')
title(ylab = "Energy sub metering")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "___",col=c("black","red","blue"))
dev.off()
