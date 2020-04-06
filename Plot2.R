##Have total emissions from PM2.5 decreased in the  Baltimore City, Maryland fips==24510 from 1999 to 2008? Use the base plotting system to make a plot answering this question.


##create a png file of plot 2
png("plot2.png", width=480, height=480)

total_emissions <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

with(total_emissions, barplot(height=Emissions, names.arg = year, col = "blue", xlab = "Year", main = expression('Baltimore Emissions from 1999 to 2008')))



##Returns graphic output to R
dev.off()