##Question #5: How have emissions from motor vehicle sources changed from 1999 to 2008 in Baltimore City?


##create a png file of plot 5
png("plot5.png", width=480, height=480)

scc_data <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicle_emissions <- NEI %>% filter(SCC %in% scc_data & fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))


vehicle_plot <- ggplot(vehicle_emissions, aes(x=year, y=Emissions, label=Emissions)) +
geom_bar(stat="identity")+ xlab("Year") +
ggtitle("Baltimore Vehicle Emissions")

print(vehicle_plot)


##Returns graphic output to R
dev.off()