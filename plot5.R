## Use loadData.R to load the data from the *.rds files before running this plot.

## Subset only vehicle-based codes (don't need level one)
SccVeh<-SCC[grepl("Vehicle",SCC$SCC.Level.Two)|grepl("Vehicle",SCC$SCC.Level.Three)|
               grepl("Vehicle",SCC$SCC.Level.Four),]

Balt<-NEI[NEI$fips == "24510",]  ## Select the Baltimore data only

## Join on SCC to get records for Coal and Combustion
NeiVeh<-merge(Balt,SccVeh,all=FALSE)

EmByYr<-aggregate(NeiVeh$Emissions,list(NeiVeh$year),FUN=sum) ## Aggregae emissions data by year and type
colnames(EmByYr)<-c("year","emissions") ## Give the aggregation columns readable names

## Plot Tons of PM2.5 Emissions per Year to plot5.png
png("plot5.png")
plot(EmByYr$year,EmByYr$emissions,xlab="Year",ylab="PM2.5 Emissions (tons)", cex=1.5,
     main="Baltimore Vehicle Tons of PM2.5 Emissions per Year",col="blue",pch=19, xaxt="n")
axis(1, xaxp=c(1999, 2008, 9)) ## Make the x axis ticks yearly
dev.off()