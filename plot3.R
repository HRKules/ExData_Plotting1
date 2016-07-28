
###############
##  CREATE PLOT
###############

## Load "dplyr" library
library(dplyr)

## Read original dataset which has previously been downloaded and extracted to subdirectory "Data" of working directory
fullData <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Extract data for desired two day period to new data set
studyData <- filter(fullData, Date == "1/2/2007" | Date == "2/2/2007")

## Add new column "date_time" to data frame that combines "Date" and "Time" character strings
studyData <- mutate(studyData, date_time = paste(studyData$Date, studyData$Time))

## Convert "date_time" to POSIXlt format
studyData$date_time <- strptime(studyData$date_time, format = "%d/%m/%Y %H:%M:%S")

## Create line plot of  "Sub_metering_1" as function of "date_time"; generate desired x-axis and y-axis labels
with(studyData, plot(date_time, Sub_metering_1, type = "l", col = "black", ylab = "Ensergy sub metering", xlab = ""))

## Add plots of "Sub_metering_2" and "Sub_metering_3" to the existing plot
with(studyData, lines(date_time, Sub_metering_2, type = "l", col = "red", ylab = "Ensergy sub metering", xlab = ""))
with(studyData, lines(date_time, Sub_metering_3, type = "l", col = "blue", ylab = "Ensergy sub metering", xlab = ""))

## Add legend in top right corner
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

###################
##  CREATE PNG FILE
###################

png(filename = "plot3.png")
with(studyData, plot(date_time, Sub_metering_1, type = "l", col = "black", ylab = "Ensergy sub metering", xlab = ""))
with(studyData, lines(date_time, Sub_metering_2, type = "l", col = "red", ylab = "Ensergy sub metering", xlab = ""))
with(studyData, lines(date_time, Sub_metering_3, type = "l", col = "blue", ylab = "Ensergy sub metering", xlab = ""))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
