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
png("plot4.png", width=480, height=480)

#Plot the graph
  par(mfrow = c(2, 2))

# plot 1 (NW)
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
    xlab = "")

# plot 2 (NE)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
    xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
    col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
    col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (SE)
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
    ylab = "Global_reactive_power", ylim = c(0, 0.5))

#Set device OFF
dev.off()
