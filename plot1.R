# set working directory
setwd("C:/Users/CH1BSVE1/Documents/Coursera/Exploratory Data Analysis")

# read the power data into a data frame
power <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE)

#create a DateTime vector and add it to the powere df
dt <- paste(power$Date,power$Time)
power$dateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

#change the Date column from char to date format (class)
power$Date<-as.Date(power$Date,format="%d/%m/%Y")

# filter data for the two days to be graphed
sub_power <- subset(power,subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

# plot the graph
hist(sub_power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

#copy the graph to a file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()