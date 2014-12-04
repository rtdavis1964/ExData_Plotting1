##  This function constructs multiple graphs in one window frame and stores the
##  resulting plot in a png file in the workind directory
plot4 <- function() {
    
    ##  Data file which resides in the working directory
    datafile <- "household_power_consumption.txt"
    
    ##  Read lines from the dates 2007-02-01 and 2007-02-02
    data <- read.table(
        text = grep("^[1,2]/2/2007", readLines(datafile), value=TRUE), 
        sep = ";", na.strings = "?")
    
    ##  Parform date and time conversion
    dateTime <- strptime(paste(data[,1], data[,2]), "%d/%m/%Y %H:%M:%S")
    
    ##  Save to a PNG file with a width of 480 pixels and a height of 480 pixels
    png(file="plot4.png",width=480,height=480)
    
    ##  Setuo plot for 2 rows and 2 columns
    par(mfrow=c(2,2))
    
    ##PLOT 1:  Plot active power over time
    plot(dateTime, as.numeric(data[, 3]), type="l", xlab="", 
        ylab="Global Active Power")
    
    ##PLOT 2:  Plot voltage over time
    plot(dateTime, as.numeric(data[, 5]), type="l", xlab="datetime", 
        ylab="Voltage")
    
    ##PLOT 3: Plot Energy sub metering, with legend (no box) 
    plot(dateTime, data[,7], type="l", xlab="", ylab="Energy sub metering")
    points(dateTime, data[,8], type = "l", col="red")
    points(dateTime, data[,9], type = "l", col="blue")
    
    legend("topright", lty = 1, col = c("black", "red", "blue"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        bty = "n", cex = 0.95)
    
    #PLOT 4:  Plot Global_reactive_power over time
    plot(dateTime,as.numeric(data[, 4]), type="l", xlab="datetime", 
        ylab="Global_reactive_power")
    
    ##  Set device back to the console screen
    dev.off()
    
    ##  Output where the file was stored
    cat("plot4.png has been saved in", getwd())
}