if (!"lubridate" %in% installed.packages()){ install.packages("lubridate")} 

# Set the working directory to where I've download the data file
setwd("/code/coursera/exploratorydataanalysis/ExData_Plotting1/")

# Read in using csv with a semi-colon seperator.  Make sure stringsAsFactors is disabled
household_power_consumption <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

# subset out just the first 2 days of Feb 2007
begin_of_feb <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]

# create a datetime column to use for the x-axis
begin_of_feb$DateTime <- strptime(paste(begin_of_feb$Date, begin_of_feb$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

# Display the plot then copy it to a png file.
plot(begin_of_feb$DateTime, begin_of_feb$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()