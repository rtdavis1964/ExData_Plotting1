##  This function  constructs a line graph that measures global active 
##  power over time and stores the resulting plot in a png file in the
##  workind directory
plot2 <- function() {
    
    ##  Data file which resides in the working directory
    datafile <- "household_power_consumption.txt"
    
    ##  Read lines from the dates 2007-02-01 and 2007-02-02
    data <- read.table(
        text = grep("^[1,2]/2/2007", readLines(datafile), value=TRUE), 
        sep = ";", na.strings = "?")
    
    ##  Save to a PNG file with a width of 480 pixels and a height of 480 pixels
    png(file="plot2.png",width=480,height=480)
    
    ##  Plot active power over time
    plot(strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S"),
        as.numeric(data[, 3]), type="l", xlab="", 
        ylab="Global Active Power (kilowatts)")
    
    ##  Set device back to the console screen
    dev.off()
    
    ##  Output where the file was stored
    cat("plot2.png has been saved in", getwd())
}