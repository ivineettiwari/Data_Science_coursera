library("data.table")

df <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
df1 <- data.table::as.data.table(x = readRDS(file = "summarydf_PM25.rds"))

# Gather the subset of the df1 data which corresponds to vehicles
condition <- grepl("vehicle", df[, df.Level.Two], ignore.case=TRUE)
vehiclesdf <- df[condition, df]
vehiclesdf1 <- df1[df1[, df] %in% vehiclesdf,]

# Subset the vehicles df1 data by each city's fip and add city name.
vehiclesBaltimoredf1 <- vehiclesdf1[fips == "24510",]
vehiclesBaltimoredf1[, city := c("Baltimore City")]

vehiclesLAdf1 <- vehiclesdf1[fips == "06037",]
vehiclesLAdf1[, city := c("Los Angeles")]

# Combine data.tables into one data.table
bothdf1 <- rbind(vehiclesBaltimoredf1,vehiclesLAdf1)

png("plot6.png")

ggplot(bothdf1, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()