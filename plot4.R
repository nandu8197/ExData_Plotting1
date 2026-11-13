
# Plot 4: Four graphs in a 2x2 layout

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Graph 1: Global Active Power
plot(datetime, data$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

# Graph 2: Voltage
plot(datetime, data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

# Graph 3: Energy Sub Metering
plot(datetime, data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       cex = 0.7)

# Graph 4: Global Reactive Power
plot(datetime, data$Global_reactive_power,
     type = "l",
     ylab = "Global reactive power",
     xlab = "datetime")

dev.off()
