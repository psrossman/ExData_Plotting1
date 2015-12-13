household_power_consumption <- read.csv("F:/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
household_power_consumption$DateTime = paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTime = as.POSIXlt(household_power_consumption$DateTime,format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Date = NULL
household_power_consumption$Time = NULL

subhousehold_power_consumption <- subset(household_power_consumption,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot3.png")
plot(x=(subhousehold_power_consumption$DateTime),y=subhousehold_power_consumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subhousehold_power_consumption$DateTime),y=subhousehold_power_consumption$Sub_metering_2,col="red")
lines(x=(subhousehold_power_consumption$DateTime),y=subhousehold_power_consumption$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()