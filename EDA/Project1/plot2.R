library("data.table")

df <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)
df[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
df[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
df <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = df[, dateTime]
     , y = df[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
