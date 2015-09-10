# plot 1
plot1 <- function() {
  
  # read data (source in the same dir)
  source("readpower.R")
  pwr <- readpower()

  # open png
  png("plot1.png", 480, 480)
  
  # draw histogram
  hist(pwr$Global_active_power, col = "red",
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
  # close png
  dev.off()
}