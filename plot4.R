file<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
new_file<-file[file$Date=="2007-02-01"|file$Date=="2007-02-02",]
new_file$DateTime <- as.POSIXct(paste(new_file$Date, new_file$Time),format = "%Y-%m-%d %H:%M:%S")

png("plot4.png",width=480,height=480)

par(mfrow=c(2,2))

plot(new_file$DateTime,new_file$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(new_file$DateTime,new_file$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(new_file$DateTime,new_file$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
lines(new_file$DateTime,new_file$Sub_metering_1)
lines(new_file$DateTime,new_file$Sub_metering_2,col="red")
lines(new_file$DateTime,new_file$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

plot(new_file$DateTime,new_file$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()