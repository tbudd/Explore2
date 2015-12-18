library(ggplot2)

## Use loadData.R to load the data from the *.rds files before running this plot.

Balt<-NEI[NEI$fips == "24510",] ## Select the Baltimore data only

EmByYr<-aggregate(Balt$Emissions,list(Balt$year,Balt$type),FUN=sum) ## Aggregae emissions data by year and type
colnames(EmByYr)<-c("year","type","emissions") ## Give the aggregation columns readable names

## Plot Tons of PM2.5 Emissions per Year to plot3.png
png("plot3.png")
g<-ggplot(EmByYr,aes(year,emissions))+geom_point(color="blue",size=3)+facet_wrap(~type,ncol=2)
g<-g+ggtitle("PM2.5 Emissions") ## Add a title
g  ## pring the plot to the png device
dev.off()