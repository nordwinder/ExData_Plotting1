# plot 3
plot3 <- function() {
  
  # read data (source in the same dir)
  source("readpower.R")
  pwr <- readpower()
  
  # open png
  png("plot3.png", 480, 480)
  
  # first draw nothing but set axes
  plot(rep(pwr$DT, 3), c(pwr$Sub_metering_1, pwr$Sub_metering_2, pwr$Sub_metering_3),
       type = "n", ylab = "Energy sub metering", xlab = "")
  # draw data
  lines(pwr$DT, pwr$Sub_metering_1, col = "black")
  lines(pwr$DT, pwr$Sub_metering_2, col = "red")
  lines(pwr$DT, pwr$Sub_metering_3, col = "blue")
  # and legend
  legend("topright", lty = "solid", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # close png
  dev.off()
}