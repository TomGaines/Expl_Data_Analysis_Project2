##Of the four types of sources indicated by type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

##create a png file of plot 3
png("plot3.png", width=480, height=480)


dat <- NEI %>% filter(fips == "24510") %>% group_by(year, type) %>% summarise(Emissions=sum(Emissions))

emissions_plot <- ggplot(data = dat, aes(x = factor(year), y = Emissions)) +
geom_bar(stat = "identity") +
facet_grid(. ~ type) +
xlab("Year") +
ggtitle("Emissions by Source") 
print(emissions_plot)


##Returns graphic output to R
dev.off()