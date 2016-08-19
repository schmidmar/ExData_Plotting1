### Exploratory Data Analysis Week 1 Homework
# source("https://www.bioconductor.org/biocLite.R"); biocLite("lattice")

library(lattice); library(ggplot2)

setwd("C:/Coursera/Exploratory Data Analysis/HouseholdPowerConsumption/")
dat <- read.table("household_power_consumption.txt", header=T, sep=";")

dat$dt <- apply(dat[,c(1:2)], 1, function(x) paste(x[1], x[2], sep = " "))

dat$dt <- strptime(dat$dt, "%d/%m/%Y %T")

sub <- dat[grep("2007-02-0[12]{1}", as.character(dat$dt)),]

plot(sub$dt, as.numeric(as.character(sub$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatt)",
     xlab = "")


png("plot1.png")
plot(sub$dt, as.numeric(as.character(sub$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatt)",
     xlab = "")
dev.off()