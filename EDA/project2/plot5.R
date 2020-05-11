library("data.table")
library("ggplot2")

df <- data.table(x = readRDS("summarydf1_PM25.rds"))
df1 <- as.data.table(x = readRDS("Source_Classification_Code.rds"))

# Gather the subset of the df data which corresponds to vehicles
vehiclesdf1 <- df1[grepl("vehicle", df1$df1.Level.Two, ignore.case=TRUE)
                   , df1]
vehiclesdf <- df[df[, df1] %in% vehiclesdf1,]

# Subset the vehicles df data to Baltimore's fip
baltimoreVehiclesdf <- vehiclesdf[fips=="24510",]

png("plot5.png")

ggplot(baltimoreVehiclesdf,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", fill ="#FF9999" ,width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()