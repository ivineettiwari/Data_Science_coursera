library("data.table")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fdf1_data.zip"
              , destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

df1 <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
df <- data.table::as.data.table(x = readRDS(file = "summarydf1_PM25.rds"))

# Prevents histogram from printing in scientific notation
df[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

totaldf <- df[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]
png("plot1.png")
barplot(totaldf[, Emissions]
        , names = totaldf[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")

dev.off()