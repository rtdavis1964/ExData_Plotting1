##  This function constructs different Energy Sub Metering graphs on the same 
##  graph with a legend and stores the resulting plot in a png file in the 
##  workind directory
plot3 <- function() {
    
    ##  Data file which resides in the working directory
    datafile <- "household_power_consumption.txt"
    
    ##  Read lines from the dates 2007-02-01 and 2007-02-02
    data <- read.table(
        text = grep("^[1,2]/2/2007", readLines(datafile), value=TRUE), 
        sep = ";", na.strings = "?")
    
    ##  Parform date and time conversion
    dateTime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
    
    ##  Save to a PNG file with a width of 480 pixels and a height of 480 pixels
    png(file="plot3.png",width=480,height=480)
    
    plot(dateTime, data[,7], type="l", xlab="", ylab="Energy sub metering")
    points(dateTime, data[,8], type = "l", col="red")
    points(dateTime, data[,9], type = "l", col="blue")
    
    legend("topright", lty = 1, col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ##  Set device back to the console screen
    dev.off()
    
    ##  Output where the file was stored
    cat("plot3.png has been saved in", getwd())
}