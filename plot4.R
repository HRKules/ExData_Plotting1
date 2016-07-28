
################
##  CREATE PLOTs
################

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

## Set up multiple plots
par(mfcol = c(2,2))

with(studyData, {
        ## Create line plot of  "Global_active_power" as function of "date_time"; generate desired x-axis and y-axis labels
        plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        
        ## Create line plot of  "Sub_metering_1" as function of "date_time"; generate desired x-axis and y-axis labels
        plot(date_time, Sub_metering_1, type = "l", col = "black", ylab = "Ensergy sub metering", xlab = "")
        ## Add plot lines for "Sub_metering_2" and "Sub_metering_3" to the existing plot
        lines(date_time, Sub_metering_2, type = "l", col = "red", ylab = "Ensergy sub metering", xlab = "")
        lines(date_time, Sub_metering_3, type = "l", col = "blue", ylab = "Ensergy sub metering", xlab = "")
        ## Add legend in top right corner with no box around it
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        
        ## Create plot of "Voltage" as function of "date_time"; generate desired x-axis and y-axis labels; suppress y-axis ticks and labels
        plot(date_time, Voltage, type = "l", xlab = "datetime", yaxt = "n")
        ## Generate desired y-axis ticks and labels
        axis(2, labels = c(234, "", 238, "", 242, "", 246), at = c(234, 236, 238, 240, 242, 244, 246))
        
        ## Create plot of "Global_reactive_power" as function of "date_time"; generate desired x-axis label
        plot(date_time, Global_reactive_power, type = "l", xlab = "datetime")
})

###################
##  CREATE PNG FILE
###################

png(filename = "plot4.png")
par(mfcol = c(2,2))
with(studyData, {
        plot(date_time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        plot(date_time, Sub_metering_1, type = "l", col = "black", ylab = "Ensergy sub metering", xlab = "")
        lines(date_time, Sub_metering_2, type = "l", col = "red", ylab = "Ensergy sub metering", xlab = "")
        lines(date_time, Sub_metering_3, type = "l", col = "blue", ylab = "Ensergy sub metering", xlab = "")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        plot(date_time, Voltage, type = "l", xlab = "datetime", yaxt = "n")
        axis(2, labels = c(234, "", 238, "", 242, "", 246), at = c(234, 236, 238, 240, 242, 244, 246))
        plot(date_time, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()

