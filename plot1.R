#plot1.R

## read in the file

    outcomefile <- read.csv("household_power_consumption.txt",
        colClasses = "character",sep=';')

## take the 2 dates we want

    electricdf1 <- subset(outcomefile,Date == "1/2/2007" | Date == "2/2/2007")

## convert the date char field to date and the Global_active_power field to number

    electricdf1$Date <- as.Date(electricdf1$Date, "%d/%m/%Y")
    electricdf1$Global_active_power <- as.numeric(electricdf1$Global_active_power)
 
## use with to pull in the dataframe

with(electricdf1,hist(Global_active_power,xlab="Global Active Power(kilowatts)",
main='Global Active Power',
col='red'
))

## write to a .png file

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

