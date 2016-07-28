
###############
##  CREATE PLOT
###############

## Load "dplyr" library
library(dplyr)

## Read original dataset which has previously been downloaded and extracted to subdirectory "Data" of working directory
fullData <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

## Extract data for desired two day period to new data set
studyData <- filter(fullData, Date == "1/2/2007" | Date == "2/2/2007")

## Create histogram of "Global Acive Power" for two day period (screen device)
hist(studyData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

###################
##  CREATE PNG FILE
###################

## Create histogram of "Global Acive Power" for two day period (PNG file device)
png(filename = "plot1.png")
hist(studyData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
