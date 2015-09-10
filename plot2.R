# plot 2
plot2 <- function() {
  
  # read data (source in the same dir)
  source("readpower.R")
  pwr <- readpower()
  
  # open png
  png("plot2.png", 480, 480)

  # draw plot
  plot(pwr$DT, pwr$Global_active_power, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")

  # close png
  dev.off()
}