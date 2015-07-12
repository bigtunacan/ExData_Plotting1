# Set the working directory to where I've download the data file
setwd("/code/coursera/exploratorydataanalysis/ExData_Plotting1/")

# Read in using csv with a semi-colon seperator.  Make sure stringsAsFactors is disabled
household_power_consumption <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", stringsAsFactors = FALSE)

# subset out just the first 2 days of Feb 2007
begin_of_feb <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]

begin_of_feb$DateTime <- strptime(paste(begin_of_feb$Date, begin_of_feb$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

# Display the plot then copy it to a png file.
# Use with to do the evaluation within a Data Environment
#
# Plot Sub_metering_1 then use the lines() function
# to add Sub_metering_2 and Sub_metering_3 to the plot
with(begin_of_feb,{
  # Set ylim to c(0, 40) to get the graph into same/similar range as the assignment and disable y axis in plot
  plot(DateTime, Sub_metering_1, type = "l", ylim = c(0,40), ylab = "Energy sub metering", xlab = "", yaxt = "n")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
  # Add values back into the Y axis to get the same ones displayed in the assignment image
  axis(side = 2, at = c(0, 10, 20, 30))
})

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()