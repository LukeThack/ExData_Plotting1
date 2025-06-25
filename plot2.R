file<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
new_file<-file[file$Date=="2007-02-01"|file$Date=="2007-02-02",]
new_file$DateTime <- as.POSIXct(paste(new_file$Date, new_file$Time),format = "%Y-%m-%d %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(new_file$DateTime,new_file$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()