library("data.table")
library("ggplot2")
df <- data.table::as.data.table(x = readRDS("summarydf1_PM25.rds"))
df1 <- data.table::as.data.table(x = readRDS("Source_Classification_Code.rds"))

combustionRelated <- grepl("comb", df1[, df1.Level.One], ignore.case=TRUE)
coalRelated <- grepl("coal", df1[, df1.Level.Four], ignore.case=TRUE) 
combustiondf1 <- df1[combustionRelated & coalRelated, df1]
combustiondf <- df[df[,df1] %in% combustiondf1]

png("plot4.png")

ggplot(combustiondf,aes(x = factor(year),y = Emissions/10^5)) +
  geom_bar(stat="identity", fill ="#FF9999", width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()