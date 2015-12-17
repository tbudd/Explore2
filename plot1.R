## Use loadData.R to load the data from the *.rds files before running this plot.

EmByYr<-aggregate(NEI$Emissions,list(NEI$year),FUN=sum) ## Aggregae emissions data by year
colnames(EmByYr)<-c("year","emissions") ## Give the aggregation columns readable names

## Plot Tons of PM2.5 Emissions per Year to plot1.png
png("plot1.png")
plot(EmByYr$year,EmByYr$emissions,xlab="Year",ylab="PM2.5 Emissions (tons)", cex=1.5,
     main="Tons of PM2.5 Emissions per Year",col="blue",pch=19, xaxt="n")
axis(1, xaxp=c(1999, 2008, 9)) ## Make the x axis ticks yearly
dev.off()