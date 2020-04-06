##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008


##create a png file of plot 4
png("plot4.png", width=480, height=480)

##establishes data set
SCC_data <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
NEI_data <- NEI %>% filter(SCC %in% SCC_data)
coal <- NEI_data %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

##creates bar graph
coal_plot <- ggplot(coal, aes(x=year, y=Emissions, label=Emissions)) +
geom_bar(stat="identity") + xlab("Year") +
ggtitle("Coal Emissions")

print(coal_plot)


##Returns graphic output to R
dev.off()