##=============================================
## Read raw Data, process it, and create Plot 3
##=============================================

# Setting the Working Directory
setwd("C:/Courses/Exploratory Data Analysis/Project 1/")

##===============================================================
## PREPROCESSING Data
##===============================================================

## Reading entire dataset
data_entire <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Formatting Date
data_entire$Date <- as.Date(data_entire$Date, format="%d/%m/%Y")

## Using only data from the dates 2007-02-01 and 2007-02-02 
data <- subset(data_entire, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove the entire data
rm(data_entire)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##==================================================================
## Plot 3
##==================================================================
with(data, {
     plot(Sub_metering_1~Datetime, type="l",
          ylab="Energy sub metering", xlab="")
          lines(Sub_metering_2~Datetime,col='Red')
          lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()