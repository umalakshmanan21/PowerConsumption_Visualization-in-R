powerconsumption<-read.table("household_power_consumption.txt",sep=";", header=T)
powerconsumption <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007"),] 
powerconsumption$combField <- paste0(powerconsumption$Date," " ,powerconsumption$Time)
powerconsumption$combField
powerconsumption$combField <- strptime(powerconsumption$combField, "%d/%m/%Y %H:%M:%S")
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)
png(file = "plot4.png")
par(mfrow=c(2,2))
par(mar=c(4,4,1,1))
plot(powerconsumption$combField ,powerconsumption$Global_active_power/1000,pch=16,type="l",xlab = "",ylab="Global Active Power(Kilowatts)")
plot(powerconsumption$combField,powerconsumption$Voltage,pch=16,type="l",xlab = "datetime",ylab="Voltage")
plot(powerconsumption$combField,powerconsumption$Sub_metering_1,type='n',ylim=range(0:35),ylab="",xlab="")
lines(powerconsumption$combField, powerconsumption$Sub_metering_1,type='l', col='black')
lines(powerconsumption$combField, powerconsumption$Sub_metering_2,type='l', col='red')
lines(powerconsumption$combField, powerconsumption$Sub_metering_3,type='l', col='blue')
title(ylab = "Energy sub metering")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch = "___",col=c("black","red","blue"))
plot(powerconsumption$combField ,powerconsumption$Global_reactive_power,pch=16,type="l",xlab = "datetime",ylab="Global_reactive_power")
dev.off()


