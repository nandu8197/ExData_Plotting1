# Course Project 1 - Plot 1

# Read household electricity data
data <- read.table(
  "data/household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Select February 1 and 2, 2007
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(
  data,
  Date >= as.Date("2007-02-01") &
    Date <= as.Date("2007-02-02")
)

# Convert Global Active Power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create PNG plot
png("plot1.png", width = 480, height = 480)

hist(
  data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)

dev.off()