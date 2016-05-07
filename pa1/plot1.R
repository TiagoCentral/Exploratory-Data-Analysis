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
png("plot2.png", width=480, height=480)

#Plot the graph
    hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
    xlab = "Global Active Power (kilowatts)", col = "red", breaks = 25, ylim = c(0, 
        1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

#Set device OFF
dev.off()
