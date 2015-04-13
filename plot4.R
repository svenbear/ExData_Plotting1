# set working directory
setwd("C:/Users/CH1BSVE1/Documents/Coursera/Exploratory Data Analysis")

# read the power data into a data frame
power <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#create a DateTime vector and add it to the powere df
dt <- paste(power$Date,power$Time)
power$dateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

#change the Date column from char to date format (class)
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

# filter data for the two days to be graphed
sub_power <- subset(power,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

#create the png device
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

# set up for 4 graphs - 2 rows by 2 cols.  Populate the graphs by row
par(mfrow = c(2,2))

# plot the four graphs
plot(sub_power$dateTime,sub_power$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(sub_power$dateTime,sub_power$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(sub_power$dateTime,sub_power$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
#add plot lines for the second and third sub metering
lines(sub_power$dateTime,sub_power$Sub_metering_2,col="red")
lines(sub_power$dateTime,sub_power$Sub_metering_3,col="blue")
# create the legend for sub metering
legend("topright", bty="n",col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1)
plot(sub_power$dateTime,sub_power$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")    


dev.off()