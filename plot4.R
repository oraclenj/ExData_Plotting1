## plot 4

## read in the file, all numeric except Date and Time fields
## only need the first 700000 rows

    originalfile <- read.csv("household_power_consumption.txt",
 colClasses = c("character","character","numeric","numeric","numeric",
    "numeric","numeric","numeric","numeric"),sep=';',comment.char="",
    na.strings="?",nrows=70000)

#strip out all but the 2 dates we want

    electricdf1 <- subset(originalfile,Date == "1/2/2007" | Date == "2/2/2007")

#create a new datetime field

    electricdf1$datetime <- strptime(paste(electricdf1$Date,electricdf1$Time),
      "%d/%m/%Y %H:%M:%S")

#-----------------------
#
# set up the plot using mfcol

par(mfcol=c(2,2))

#topleft plot -----------

#set up the base plot, but don't print any data

with(electricdf1,plot(datetime,Global_active_power,
 ylab="Global Active Power",xlab="",
 type="n"
))

#add lines

with(electricdf1,lines(datetime,Global_active_power))

#bottomleft plot -----------

#set up the base plot, but don't print any data

with(electricdf1,plot(datetime,Sub_metering_1,
 ylab="Energy sub metering",xlab="",
 type="n"
))

#add lines, one for each parm

with(electricdf1,lines(datetime,Sub_metering_1))

with(electricdf1,lines(datetime,Sub_metering_2,col="red"))

with(electricdf1,lines(datetime,Sub_metering_3,col="blue"))

legend("topright",legend=c('Sub_metering_1   ','Sub_metering_2   ',
  'Sub_metering_3   '),
lty=c(1,1,1),
lwd=c(1,1,1),
bty="n",
col=c("black","red","blue")
)


#topright plot -----------

#set up the base plot, but don't print any data

with(electricdf1,plot(datetime,Voltage,
## ylab="Global Active Power(kilowatts)",xlab="",
 type="n"
))

#add lines

with(electricdf1,lines(datetime,Voltage))

#bottomright plot -----------

#set up the base plot, but don't print any data

with(electricdf1,plot(datetime,Global_reactive_power,
## ylab="Global Active Power(kilowatts)",xlab="",
 type="n"
))

#add lines

with(electricdf1,lines(datetime,Global_reactive_power))


dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()





