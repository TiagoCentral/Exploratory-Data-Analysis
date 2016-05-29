getwd()

NEI <- readRDS("../data/summarySCC_PM25.rds")
SCC <- readRDS("../data/Source_Classification_Code.rds")

aggregate.data <- with(NEI, aggregate(Emissions, by = list(year), sum))


plot(aggregate.data, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in the United States")
polygon(aggregate.data, col = "green", border = "blue")