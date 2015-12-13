household_power_consumption <- read.csv("F:/Downloads/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";")
household_power_consumption$DateTime = paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DateTime = as.POSIXlt(household_power_consumption$DateTime,format="%d/%m/%Y %H:%M:%S")
household_power_consumption$Date = NULL
household_power_consumption$Time = NULL
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)


subhousehold_power_consumption <- subset(household_power_consumption,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2));

png("plot1.png")
hist(subhousehold_power_consumption$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()
