
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

## Create line plot of  "Global_active_power" as function of "date_time"; generate desired x-axis and y-axis labels
with(studyData, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

###################
##  CREATE PNG FILE
###################

png(filename = "plot2.png")
with(studyData, plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
