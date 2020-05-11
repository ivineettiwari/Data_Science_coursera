library("data.table")
library("ggplot2")

df1 <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))
df <- data.table::as.data.table(x = readRDS("summarySCC_PM25.rds"))

# Subset df data by Baltimore
baltimoredf <- df[fips=="24510",]

png("plot3.png")

ggplot(baltimoredf,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()