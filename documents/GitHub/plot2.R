## getting data
data_all <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## subsetting data
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## plot 
plot(data$Global_active_power~data$Datetime, type="l",main ="", ylab="Global Active Power (kilowatts)", xlab="")

## saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()