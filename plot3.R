## Plotting 3rd graphic


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
png(file="plot3.png")
with(sub,plot(Date_Time,Sub_metering_1,col="black",type="l",xlab="",ylab = "Energy sub metering"))
with(sub,lines(Date_Time,Sub_metering_2,col="red"))
with(sub,lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=names(sub)[8:10])
dev.off()
