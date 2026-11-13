
# Course Project 1 - Plot 3

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

# Convert sub-metering values to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create date and time
datetime <- strptime(
  paste(data$Date, data$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

# Create PNG plot
png("plot3.png", width = 480, height = 480)

plot(
  datetime,
  data$Sub_metering_1,
  type = "l",
  col = "black",
  ylab = "Energy sub metering",
  xlab = ""
)

lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1
)

dev.off()
