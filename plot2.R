## Use loadData.R to load the data from the *.rds files before running this plot.

Balt<-NEI[NEI$fips == "24510",]  ## Select the Baltimore data only

EmByYr<-aggregate(Balt$Emissions,list(Balt$year),FUN=sum) ## Aggregae emissions data by year
colnames(EmByYr)<-c("year","emissions") ## Give the aggregation columns readable names

## Plot Tons of PM2.5 Emissions per Year to plot2.png
png("plot2.png")
plot(EmByYr$year,EmByYr$emissions,xlab="Year",ylab="PM2.5 Emissions (tons)", cex=1.5,
     main="Baltimore Tons of PM2.5 Emissions per Year",col="blue",pch=19, xaxt="n")
axis(1, xaxp=c(1999, 2008, 9)) ## Make the x axis ticks yearly
dev.off()