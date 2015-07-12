# Set the working directory to where I've download the data file
setwd("/code/coursera/exploratorydataanalysis/ExData_Plotting1/")

# Read in using csv with a semi-colon seperator.  Make sure stringsAsFactors is disabled
household_power_consumption <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep = ";", stringsAsFactors = FALSE)

# subset out just the first 2 days of Feb 2007
begin_of_feb <- household_power_consumption[household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007" ,]

# Display the histogram then copy it to a png file.
hist(as.numeric(begin_of_feb$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()