### Exploratory Data Analysis Week 1 Homework
# source("https://www.bioconductor.org/biocLite.R"); biocLite("lattice")

library(lattice); library(ggplot2)

setwd("C:/Coursera/Exploratory Data Analysis/HouseholdPowerConsumption/")
dat <- read.table("household_power_consumption.txt", header=T, sep=";")

dat$dt <- apply(dat[,c(1:2)], 1, function(x) paste(x[1], x[2], sep = " "))

dat$dt <- strptime(dat$dt, "%d/%m/%Y %T")

sub <- dat[grep("2007-02-0[12]{1}", as.character(dat$dt)),]

plot(sub$dt, as.numeric(as.character(sub$Sub_metering_1)), type = "l",
     xlab = "", col = "black", ylab = "Energy sub metering")
lines(sub$dt, as.numeric(as.character(sub$Sub_metering_2)), col = "red")
lines(sub$dt, as.numeric(as.character(sub$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), 
       lwd= c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))


png("plot3.png")

plot(sub$dt, as.numeric(as.character(sub$Sub_metering_1)), type = "l",
     xlab = "", col = "black", ylab = "Energy sub metering")
lines(sub$dt, as.numeric(as.character(sub$Sub_metering_2)), col = "red")
lines(sub$dt, as.numeric(as.character(sub$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), 
       lwd= c(2.5, 2.5, 2.5), col = c("black", "red", "blue"))

dev.off()