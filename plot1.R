##  This function constructs a histogram that measures that frequency of 
##  global energy usage and stores the resulting plot in a png file in the
##  workind directory
plot1 <- function() {
    
    ##  Data file which resides in the working directory
    datafile <- "household_power_consumption.txt"
    
    ##  Read lines from the dates 2007-02-01 and 2007-02-02
    data <- read.table(
        text = grep("^[1,2]/2/2007", readLines(datafile), value=TRUE), 
        sep = ";", na.strings = "?")
    
    ##  Save to a PNG file with a width of 480 pixels and a height of 480 pixels
    png(file="plot1.png",width=480,height=480)
    
    ##  Histogram the Global Active Power
    hist(as.numeric(data[, 3]), main = "Global Active Power", 
        ylab = "Frequency", xlab = "Global Active Power (kilowatts)", 
        col = "red", ylim = c(0, 1200), xlim = c(0, 6))
    
    ##  Set device back to the console screen
    dev.off()

    ##  Output where the file was stored
    cat("plot1.png has been saved in", getwd())
}