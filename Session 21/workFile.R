library("ggplot2")

# read in the file
filename <- "Ticketleap_2017_Export.csv" 
data <- read.csv(filename)

#columns by name
keeps <- c("Event", "Ticket.Net.Proceeds", "Buyer.Postal.Code", "Date.of.Purchase")
data <- data[keeps]

#rows by name

#FILTER FAIL
tb <- table(factor(data$Event))
# funData <- subset(data, tb[Event] > 100)

#gives you the list of events that meet our criteria
EventKeeps <- Filter(function(x) tb[x] >1000, data$Event)

data <- subset(data, Event %in% EventKeeps)

varVar <- ggplot( data, aes(Event)) + geom_bar()
