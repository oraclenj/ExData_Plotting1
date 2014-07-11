## plot 3

## read in the file, all numeric except Date and Time fields
## only need the first 700000 rows

    originalfile <- read.csv("household_power_consumption.txt",
 colClasses = c("character","character","numeric","numeric","numeric",
    "numeric","numeric","numeric","numeric"),sep=';',comment.char="",
    na.strings="?",nrows=70000)

#strip out all but the 2 dates we want

    electricdf1 <- subset(originalfile,Date == "1/2/2007" | Date == "2/2/2007")

#create a new datetime field

    electricdf1$DateTime <- strptime(paste(electricdf1$Date,electricdf1$Time),
      "%d/%m/%Y %H:%M:%S")

#set up the base plot, but don't print any data

with(electricdf1,plot(DateTime,Sub_metering_1,
 ylab="Energy sub metering",xlab="",
 type="n"
))

#add lines, one for each parm

with(electricdf1,lines(DateTime,Sub_metering_1))

with(electricdf1,lines(DateTime,Sub_metering_2,col="red"))

with(electricdf1,lines(DateTime,Sub_metering_3,col="blue"))

legend("topright",legend=c('Sub_metering_1  ','Sub_metering_2  ',
  'Sub_metering_3  '),
lty=c(1,1,1),
lwd=c(1,1,1),
col=c("black","red","blue")
)

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()





