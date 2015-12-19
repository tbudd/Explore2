library(ggplot2)

## Use loadData.R to load the data from the *.rds files before running this plot.

BaltLA<-NEI[NEI$fips == "24510"|NEI$fips == "06037",] ## Subset Baltimore and LA data only

## Make a more readable column for the city source
BaltLA$city<-"Baltimore"
BaltLA[BaltLA$fips=="06037",7]<-"Los Angeles"

EmByYr<-aggregate(BaltLA$Emissions,list(BaltLA$year,BaltLA$city),FUN=sum) ## Aggregae emissions data by year and city
colnames(EmByYr)<-c("year","city","emissions") ## Give the aggregation columns readable names

## Plot Tons of PM2.5 Emissions per Year to plot6.png
png("plot6.png")
g<-ggplot(EmByYr,aes(year,emissions,color=factor(city)))+geom_point(size=4)
g<-g+ggtitle("Baltimore vs. LA PM2.5 Emissions") ## Add a title
g  ## print the plot to the png device
dev.off()