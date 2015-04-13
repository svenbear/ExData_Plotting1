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
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

# plot sub metering #1 as a black line
plot(sub_power$dateTime,sub_power$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")

#add plot lines for the second and third sub metering
lines(sub_power$dateTime,sub_power$Sub_metering_2,col="red")
lines(sub_power$dateTime,sub_power$Sub_metering_3,col="blue")

# create the legend
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1)

dev.off()