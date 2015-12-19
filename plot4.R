## Use loadData.R to load the data from the *.rds files before running this plot.

## Subset only Coal-based codes
SccCoal<-SCC[grepl("Coal",SCC$SCC.Level.One)|grepl("Coal",SCC$SCC.Level.Two)|
               grepl("Coal",SCC$SCC.Level.Three)|grepl("Coal",SCC$SCC.Level.Four),]

## Now subset on Combustion (don't need to use level four because there are no matches on that column)
SccCoalComb<-SccCoal[grepl("Combustion",SccCoal$SCC.Level.One)|grepl("Combustion",SccCoal$SCC.Level.Two)|
                          grepl("Combustion",SccCoal$SCC.Level.Four),]

## Join on SCC to get records for Coal and Combustion
NeiCoalComb<-merge(NEI,SccCoalComb,all=FALSE)

EmByYr<-aggregate(NeiCoalComb$Emissions,list(NeiCoalComb$year),FUN=sum) ## Aggregae emissions data by year and type
colnames(EmByYr)<-c("year","emissions") ## Give the aggregation columns readable names

## Plot Tons of PM2.5 Emissions per Year to plot4.png
png("plot4.png")
plot(EmByYr$year,EmByYr$emissions,xlab="Year",ylab="PM2.5 Emissions (tons)", cex=1.5,
     main="Coal Combustion Tons of PM2.5 Emissions per Year",col="blue",pch=19, xaxt="n")
axis(1, xaxp=c(1999, 2008, 9)) ## Make the x axis ticks yearly
dev.off()