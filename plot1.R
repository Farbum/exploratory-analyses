## Plotting first graphic


##Loading appropriate libraries and reading the database

library(data.table,lubridate,dplyr)
setwd("C://Users/Had/R directory/data/")
houseNRJ<-read.table("household_power_consumption.txt",sep=";",header=T,colClasses = "character")
for (i in 3:9) {
        houseNRJ[,i]<-as.numeric(houseNRJ[,i])
}
houseNRJ$Date<-dmy(houseNRJ$Date)
houseNRJ$Time<-hms(houseNRJ$Time)

##subsetting only dates 2007-02-01 and 2007-02-02
sub<-houseNRJ[houseNRJ$Date==ymd("2007-02-01")|houseNRJ$Date==ymd("2007-02-02"),]

##graphic device
png(file="plot1.png")
hist(sub$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
