file<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
new_file<-file[file$Date=="2007-02-01"|file$Date=="2007-02-02",]
png(filename="plot1.png",width=480,height=480)
hist(new_file$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()
