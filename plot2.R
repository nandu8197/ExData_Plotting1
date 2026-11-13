
# Course Project 1 - Plot 2

# Read household electricity data
data <- read.table(
  "data/household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Select February 1 and 2, 2007
data <- subset(
  data,
  Date >= as.Date("2007-02-01") &
    Date <= as.Date("2007-02-02")
)

# Convert Global Active Power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create date and time
datetime <- strptime(
  paste(data$Date, data$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

# Create PNG plot
png("plot2.png", width = 480, height = 480)

plot(
  datetime,
  data$Global_active_power,
  type = "l",
  ylab = "Global Active Power (kilowatts)",
  xlab = ""
)

dev.off()
