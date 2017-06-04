powerconsumption<-read.table("household_power_consumption.txt",sep=";", header=T)
powerconsumption <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007"),] 
powerconsumption$combField <- paste0(powerconsumption$Date," " ,powerconsumption$Time)
powerconsumption$combField
powerconsumption$combField <- strptime(powerconsumption$combField, "%d/%m/%Y %H:%M:%S")
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)

png(file = "plot2.png")
plot(powerconsumption$combField ,powerconsumption$Global_active_power/1000,pch=16,type="l",xlab = "",ylab="Global Active Power(Kilowatts)")
dev.off()


