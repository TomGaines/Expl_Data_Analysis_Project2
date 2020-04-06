## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##create a png file of plot 1
png("plot1.png", width=480, height=480)

total_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)
with(total_emissions, barplot(height=Emissions, names.arg = year, col = "green", xlab = "Year", main = expression('Annual Emissions from 1999 to 2008')))

##Returns graphic output to R
dev.off()