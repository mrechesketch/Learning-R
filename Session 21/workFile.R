library("ggplot2")



# write a new (smaller) relevant data set
# techniques courtesy of:
    # http://www.dummies.com/programming/r/how-to-remove-rows-with-missing-data-in-r/
    # http://www.instantr.com/2012/12/11/exporting-a-dataset-from-r/
writeCleanData <- function(){
    # read in the file
    filename <- "Ticketleap_2017_Export.csv" 
    data <- read.csv(filename)
    cat(filename, "is read in", "\n")
    # data filtering step
    ocols <- ncol(data) # keep track
    keeps <- c("Event", "Ticket.Net.Proceeds", "Buyer.Postal.Code", "Date.of.Purchase")
    data <- data[keeps] # keep only good columns
    ncols <- ncol(data)
    cat(ocols - ncols, "columns have been dropped", "\n")
    # write to a new file
    newFilename <- "Ticketleap_2017.csv"
    write.csv(data, newFilename, row.names=F)
    cat("data has been written to: ", filename, "\n")
}

# read in our smaller file
filename <- "Ticketleap_2017.csv"
data <- read.csv(filename)

# returns a data frame with no na values for zipcode
dropEmptyZips <- function(data){
    orows <- nrow(data)
    data$Buyer.Postal.Code <- as.numeric( as.character(df$Buyer.Postal.Code) ) # quirky
    data <- na.omit(data) # drop rows with missing data
    nrows <- nrow(data)
    cat(orows - nrows, "rows have been dropped", "\n")
    return( data )
}

#rows by name

#FILTER FAIL
eventFactor <- factor(data$Event)
tb <- table(eventFactor)
# funData <- subset(data, tb[Event] > 100)

#gives you the list of events that meet our criteria
EventKeeps <- Filter(function(x) tb[x] >1000, data$Event)

ndata <- subset(data, Event %in% EventKeeps)

#varVar <- ggplot( ndata, aes(Event)) + geom_bar()
