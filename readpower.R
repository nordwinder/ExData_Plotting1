# reads data and select only needed
readpower <- function() {
 
# open file or zip-file connection   
  if (file.exists("household_power_consumption.txt")) {
    f <- file("household_power_consumption.txt", open = "rt")
  } else if (file.exists("household_power_consumption.zip")) {
    f <- unz("household_power_consumption.zip", 
             "household_power_consumption.txt", open = "rt")
  } else {
    stop("household_power_consumption.zip or .txt file should exist")
  }
 
# reads everything (don't know how to read selection)
  pwr <- read.table(f, header = TRUE, sep = ";", na.strings = "?", nrows = 2080000,
                    colClasses = c(rep("character", 2), rep("numeric", 7)))
  close(f)
  
# select only two days by string comparison (faster)
  sel <- (pwr$Date == "1/2/2007") | (pwr$Date == "2/2/2007")
  pwr <- pwr[sel,]

# parse dates  
  pwr$DT <- strptime(paste(pwr$Date, pwr$Time), format = "%d/%m/%Y %H:%M:%S")
 
  return(pwr)
}