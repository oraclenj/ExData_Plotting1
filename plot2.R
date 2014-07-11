

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

with(electricdf1,plot(DateTime,Global_active_power,
 ylab="Global Active Power(kilowatts)",xlab="",
 type="n"
))

#add lines

with(electricdf1,lines(DateTime,Global_active_power))

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()


