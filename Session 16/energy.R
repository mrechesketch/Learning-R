library("ggplot2")

# read in the file
filename <- "Residential_Average_Monthly_kWh_and_Bills.csv" 
data <- read.csv(filename)



# some helper functions
getDateOrTime <- function(dateTime, index){
    # inde = 1 for date, 2 for time
    dateAndTime <- strsplit(dateTime, " ")[[1]]
    dateAndTime[index]
}

monthDayYear <- function(date, index){
    # index = 1 is month, 2 day, 3 year
    mDY <- strsplit(date, "/")[[1]]
    mDY[index]
}

getMonth <- function(code){
    months <- c("Jan", "Feb", "March",
    "April", "May", "June", "July",
    "August", "Sept", "Oct", "Nov", "Dec" )
    date <- getDateOrTime(code, 1)
    month <- as.numeric( monthDayYear(date, 1) )
    months[month]
} 

getYear <- function(code){
    date <- getDateOrTime(code, 1)
    year <- as.integer( monthDayYear(date, 3) )
    return(year)
}


# Process the data
dateString <- as.character( data$Date )
data$Years <- getYear(dateString)
data$Months <- getMonth(dateString)
data$Date <- as.Date( data$Date, "%m/%d/%Y" ) # turn strings into dates
# help http://www.statmethods.net/input/dates.html
data$Average.Bill <- as.numeric( sub('\\$', '', data$Average.Bill) ) # turn monies into numerics
# super helpful!! http://rfunction.com/archives/2354 / http://www.endmemo.com/program/R/sub.php

# Some cursory graphs
dateVsMoney <- ggplot(data, aes(Date, Average.Bill) ) + geom_line()
dateVsConsumption <- ggplot(data, aes(Date, Average.kWh) ) + geom_line()
dateVsCharge <- ggplot(data, aes(Date, Fuel.Charge..Cents.kWh.) ) + geom_line()

# lets keep going
data$t <- as.integer( data$Date - data$Date[1] ) # days since Jan 1 2000
data$monthly <- data$t %% 365
data$year <- (data$t %/% 365) + 2000 

dateVsConsumption2 <- ggplot(data, aes(monthly, Average.kWh, colour = year) ) + geom_point()

dateVsConsumption3 <- ggplot(data, aes(Months, Average.kWh) ) + geom_boxplot()


plot.frequency.spectrum <- function(X.k, xlimits=c(0,length(X.k))) {
  plot.data  <- cbind(0:(length(X.k)-1), Mod(X.k))

  # TODO: why this scaling is necessary?
  plot.data[2:length(X.k),2] <- 2*plot.data[2:length(X.k),2] 
  
  plot(plot.data, t="h", lwd=2, main="", 
       xlab="Frequency (Hz)", ylab="Strength", 
       xlim=xlimits, ylim=c(0,max(Mod(plot.data[,2]))))
}

# Plot the i-th harmonic
# Xk: the frequencies computed by the FFt
#  i: which harmonic
# ts: the sampling time points
# acq.freq: the acquisition rate
plot.harmonic <- function(Xk, i, ts, acq.freq, color="red") {
  Xk.h <- rep(0,length(Xk))
  Xk.h[i+1] <- Xk[i+1] # i-th harmonic
  harmonic.trajectory <- get.trajectory(Xk.h, ts, acq.freq=acq.freq)
  points(ts, harmonic.trajectory, type="l", col=color)
}

hmm <- fft(data$Average.kWh)