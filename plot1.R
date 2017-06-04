powerconsumption<-read.table("household_power_consumption.txt",sep=";", header=T)
powerconsumption <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007"),] 
powerconsumption$combField <- paste0(powerconsumption$Date," " ,powerconsumption$Time)
powerconsumption$combField
powerconsumption$combField <- strptime(powerconsumption$combField, "%d/%m/%Y %H:%M:%S")
powerconsumption$Global_active_power <- as.numeric(powerconsumption$Global_active_power)

png(file = "plot1.png")
hist(powerconsumption$Global_active_power/1000,xlab="Global Active Power (Kilowatts)",ylab= "Frequency",col="red",main = "Global Active Power")
dev.off()

