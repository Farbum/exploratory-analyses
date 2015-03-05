## Plotting 2nd graphic


##Loading appropriate libraries and reading the database

library(lubridate,dplyr)
setwd("C://Users/Had/R directory/data/")
houseNRJ<-read.table("household_power_consumption.txt",sep=";",header=T,colClasses = "character")
for (i in 3:9) {
        houseNRJ[,i]<-as.numeric(houseNRJ[,i])
}


houseNRJ$Date<-as.Date(houseNRJ$Date,"%d/%m/%Y")

##subsetting only dates 2007-02-01 and 2007-02-02
sub<-houseNRJ[houseNRJ$Date==as.Date("01/02/2007","%d/%m/%Y")|houseNRJ$Date==as.Date("02/02/2007","%d/%m/%Y"),]

##adding a Date_Time column
Date_Time<-strptime(paste(sub$Date,sub$Time),"%Y-%m-%d %H:%M:%S")
sub<-cbind(Date_Time,sub)


##graphic device
png(file="plot2.png")
with(sub,plot(Date_Time,Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)"))
dev.off()

