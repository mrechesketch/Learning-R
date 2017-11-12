library("ggplot2")

# read in the file
filename <- "Ticketleap_2017_Export.csv" 
data <- read.csv(filename)

getDateOrTime <- function(DateOfPurchase, index){
    # inde = 1 for date, 2 for time
    dateAndTime <- strsplit(DateOfPurchase, " ")[[1]]
    dateAndTime[index]
}

monthDayYear <- function(date, index){
    # index = 1 is month, 2 day, 3 year
    mDY <- strsplit(date, "/")[[1]]
    mDY[index]
}

monthNames <- c("Jan", "Feb", "March",
    "April", "May", "June", "July",
    "August", "Sept", "Oct", "Nov", "Dec" )

getMonth <- function(code){
    date <- getDateOrTime(code, 1)
    month <- as.numeric( monthDayYear(date, 1) )
    monthNames[month]
} 

dateString <- as.character( data$Date )
data$Years <- sapply(dateString, getYear)
data$Months <- sapply(dateString, getMonth)
data$Date <- as.Date( data$Date, "%m/%d/%Y" )
data$TicketNetProceeds <- as.numeric( sub('\\$', '', data$TicketNetProceeds) ) 

dateVsMoney <- ggplot(data, aes(Date, TicketNetProceeds) ) + geom_line()