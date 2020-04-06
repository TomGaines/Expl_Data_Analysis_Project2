##6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == 06037|}fips==06037). Which city has seen greater changes over time in motor vehicle emissions?


##create a png file of plot 6
png("plot6.png", width=480, height=480)

counties <- data.frame(fips = c("06037", "24510"), county = c("Los Angeles", "Baltimore"))

SCC_data <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicle_emissions <- NEI %>% filter(SCC %in% SCC_data & fips %in% counties$fips) %>% group_by(fips, year) %>% summarize(Emissions = sum(Emissions))

vehicle_emissions <- merge(vehicle_emissions, counties)

county_plot <- ggplot(vehicle_emissions, aes(x = factor(year), y = Emissions, 
label = Emissions)) +
geom_bar(stat = "identity") + facet_grid(. ~ county) +
xlab("Year") +
ggtitle("Los Angeles and Baltimore Vehicle Emissions.")

print(county_plot)


##Returns graphic output to R
dev.off()