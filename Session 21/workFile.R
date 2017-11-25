library("ggplot2")



# write a new (smaller) relevant data set
#how to clean a dataset
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


# ======================= SUMMARY DATA FRAME ================== #

# similar to a pivot table, we're going to create a summary data table which
# will have all the data we want to graph in a concise place
# I was having a hard time imagining how to create plots from the original data table

# Headers : Events, Volume, Total Proceeds, 
#           Most Common Zip (w/ NA), Most Common Zip (w/out NA), 
#           Hottest Month-Day, Day of Week

# Here we will create vectors Events and Volume

eventFactor <- factor(data$Event) 
eventTable <- sort( table(eventFactor), decreasing = TRUE )
# Where did I see table sorting? 
# https://www.r-bloggers.com/r-function-of-the-day-table/

# Where did I pull names and as.vector out of?
# https://stackoverflow.com/questions/10104400/extract-a-row-from-a-table-object
Events <- names( eventTable ) 
Volume <- as.vector( eventTable )

# Moving onto total proceeds
#totally cool, memorize
Total_Proceeds <- sapply(Events, function(e) sum( subset(data, Event == e )$Ticket.Net.Proceeds ) )

# And now zip code analysis

# here is a helper function
maxString <- function(stringVec, NA_flag = "no" ){
    stringFactor <- factor( stringVec )
    stringTable <- sort( table(stringFactor, useNA = NA_flag) )
    names( stringTable[1] )
}


#Most_Common_Zip_NA <- sapply(Events, function(e) maxZipCode( subset(data, Event == e)$Buyer.Postal.Code, "always") )
# kinda boring but helpful to see missing values 
# again, taken from https://www.r-bloggers.com/r-function-of-the-day-table/ 
Most_Common_Zip <- sapply(Events, function(e) maxString( subset(data, Event == e)$Buyer.Postal.Code, "no") )

# and lastly peak month-day
extract <- function(patt, string) regmatches(string, regexpr(patt, string, perl = T) )

maxDate <- function(dates){
    ymds <- extract(".+ ", as.character(dates) )
    return( maxString( ymds ) )
}



Peak_Day <- as.Date( sapply( Events, function(e) maxDate( subset(data, Event == e)$Date.of.Purchase ) ) )
Day_of_Week <- weekdays( Peak_Day )

# now bring it all together

summary <- data.frame(Events, Volume, Total_Proceeds, Most_Common_Zip, Peak_Day, Day_of_Week )
fileWriter <- function(){
    summaryName <- "Summary_2017.csv"
    write.csv(summary, summaryName, row.names=F)
    cat("data has been written to: ", summaryName, "\n")
}

zipFactor <- factor(data$Buyer.Postal.Code)
ZipTable <- sort( table(zipFactor), decreasing=TRUE)

zips <- names(ZipTable)

zipVolume <- as.vector(ZipTable)

zipdf <- data.frame(zips, zipVolume)

ggplot(zipdf[2:16,], aes(reorder(zips, -zipVolume), zipVolume) )+geom_point() +geom_text(aes(label=zipVolume))

# theTable <- within(data, 
#                    Buyer.Postal.Code <- factor(Buyer.Postal.Code, 
#                                       levels=names(sort(table(Buyer.Postal.Code), 
#                                                         decreasing=TRUE))))

# ======================= EVENT VS PROCEEDS ================== #

# CHART TYPE : Bar
# X AXIS : Column - "Event" , Type - CHARACTER 
# Y AXIS : Column - Proceeds , Type - NUMERIC 
# BRIEF : low proceed Events are filtered out (specifics??) and then plotted against their total proceeds 


# funData <- subset(data, tb[Event] > 100)

#gives you the list of events that meet our criteria
# EventKeeps <- Filter(function(x) tb[x] >1000, data$Event)

# ndata <- subset(data, Event %in% EventKeeps) 
# varVar <- ggplot( ndata, aes(Event)) + geom_bar()


# ======================= DATE VS PROCEEDS ================== #