if (!file.exists("./data/household_power_consumption.txt")) {
    #dawnloadind file
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/power_data.zip")
    unzip("./data/power_data.zip", overwrite = T, exdir = "./data")
}

#Installing needed packages

install.packages(c("devtools","MatrixEQTL"))
source("http://www.bioconductor.org/biocLite.R")
biocLite(c("Biobase","goseq","DESeq2"))

#loading to a datafile
datafile <- "./data/household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Generate the Png File
png("plot3.png", width=480, height=480)

#Plot the graph
   plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
    col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))

#Set device OFF
dev.off()
