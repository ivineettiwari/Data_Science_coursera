library("data.table")
df <- data.table(x = readRDS(file = "Source_Classification_Code.rds"))
df1 <- data.table(x = readRDS(file = "summarySCC_PM25.rds"))

df1[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
totaldf1 <- df1[fips=='24510', lapply(.SD, sum, na.rm = TRUE)
                , .SDcols = c("Emissions")
                , by = year]



barplot(totaldf1[, Emissions]
        , names = totaldf1[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
