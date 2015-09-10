# plot 4
plot4 <- function() {
  
  # read data (source in the same dir)
  source("readpower.R")
  pwr <- readpower()
  
  # open png
  png("plot4.png", 480, 480)
  
  # set 2x2 canvas
  par(mfrow = c(2, 2))
  
  # first plot
  plot(pwr$DT, pwr$Global_active_power, type = "l",
       ylab = "Global Active Power", xlab = "")
  
  # second plot
  plot(pwr$DT, pwr$Voltage, type = "l",
       ylab = "Voltage", xlab = "datetime")
  
  # third plot
  plot(rep(pwr$DT, 3), c(pwr$Sub_metering_1, pwr$Sub_metering_2, pwr$Sub_metering_3),
       type = "n", ylab = "Energy sub metering", xlab = "")
  lines(pwr$DT, pwr$Sub_metering_1, col = "black")
  lines(pwr$DT, pwr$Sub_metering_2, col = "red")
  lines(pwr$DT, pwr$Sub_metering_3, col = "blue")
  legend("topright", lty = "solid", col = c("black", "red", "blue"), bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  # last one
  plot(pwr$DT, pwr$Global_reactive_power, type = "l",
       ylab = "Global_reactive_power", xlab = "datetime")
    
  # close png
  dev.off()
}