library("data.table")
df<- data.table::fread(input = "household_power_consumption.txt",na.strings = "?")
colnames(df)
df[,Global_active_power:=lapply(.SD,as.numeric),.SDcols=c("Global_active_power")]
df[,Date:=lapply(.SD,as.Date,"%d%m%y"),.SDcols=c("Date")]
df<-df[(Date>="2007-02-01")&(Date<="2007-02-03")]

png("plot10.png", width=480, height=480)
hist(df[, Global_active_power], main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.off()

