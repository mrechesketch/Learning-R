
# load the data set from csv (see Session 21/workfile.R )
    # resource: https://stackoverflow.com/questions/5187745/imported-a-csv-dataset-to-r-but-the-values-becomes-factors
    # resource: https://stat.ethz.ch/R-manual/R-devel/library/utils/html/read.table.html

# df <- read.table("used_cars-train.csv", header = TRUE,
#                 sep = ",", fill = TRUE, stringsAsFactors = FALSE)

cleanData <- function(filename){
   
    df <- read.csv(filename, stringsAsFactors = FALSE)

    iRow <- nrow(df) # initial rows

    # drop the uneeded columns (see Session 21/workfile.R... again)

    colsToKeep <- c("dateCrawled", "price", "abtest", "yearOfRegistration", 
                    "gearbox", "powerPS", "kilometer", "monthOfRegistration", 
                    "fuelType", "notRepairedDamage", "dateCreated", "lastSeen")

    df <- df[colsToKeep]

    # CONVERT sparse rows to NA - GLOBAL CHANGE
        # resource: https://stackoverflow.com/questions/9977686/how-to-remove-rows-with-a-zero-value-in-r

    df[ df == "" ] <- NA # eliminate empty strings
    df[ df == 0 ] <- NA # eliminate 0's
    df$yearOfRegistration[ df$yearOfRegistration >= 2017 ] <- NA # data set was taken in 2016...
    df$price[ df$price >= 100000 ] <- NA # get rid of absurd prices 
    df$price[ df$price == 1 ] <- NA # this isn't price is right!!

    # check string values to make sure they are binary, exclude all others
        # resource: https://stackoverflow.com/questions/31156957/use-of-switch-in-r-to-replace-vector-values

        # abtest
    encodeABTest <- Vectorize( function(query) switch(query, test = "test", control = "control", NA) ) # last value is default

        # gearbox
    encodeGearbox <- Vectorize( function(query) switch(query, manuell = "manuell", automatik = "automatik", NA) )

        # fuelType
    encodeFuelType <- Vectorize( function(query) switch(query, benzin = "benzin", diesel = "diesel", NA) )

        # notRepairedDamage
    encodeNRD <- Vectorize( function(query) switch(query, ja = "ja", nein = "nein", NA ) )

    funs <- list(encodeABTest, encodeGearbox, encodeFuelType, encodeNRD)
    fields <- c("abtest", "gearbox", "fuelType", "notRepairedDamage")

    for( i in seq_along(funs) ) df[fields[i]] <- sapply(df[fields[i]], funs[[i]])


    # lastly, omit all na
    df <- na.omit(df)

    fRow <- nrow(df) # check final rows

    cat("Initial number of rows: ", iRow, "\n")
    cat("Final number of rows: ", fRow, "\n")
    cat("Dropped rows: ", iRow - fRow, "\n")
    
    return(df)
}

transformData <- function(df){
    # functions to encode strings
        # resource: https://stackoverflow.com/questions/31156957/use-of-switch-in-r-to-replace-vector-values

        # abtest
    encodeABTest <- Vectorize( function(query)  if( query == "test") 1 else -1 ) # last value is default

        # gearbox
    encodeGearbox <- Vectorize( function(query)  if( query == "manuell") 1 else -1 )

        # fuelType
    encodeFuelType <- Vectorize( function(query)  if( query == "benzin") 1 else -1 )

        # notRepairedDamage
    encodeNRD <- Vectorize( function(query)  if( query == "ja") 1 else -1 )

    funs <- list(encodeABTest, encodeGearbox, encodeFuelType, encodeNRD)
    fields <- c("abtest", "gearbox", "fuelType", "notRepairedDamage")

    for( i in seq_along(funs) ) df[fields[i]] <- sapply(df[fields[i]], funs[[i]])

    # date related functions
        # howLongAgo
    howLongAgo <- function(dateCrawled){
        begin <- as.Date(dateCrawled)
        end <- Sys.Date()
        as.integer( end - begin )
    }

    df$howLongAgo <- with(df, howLongAgo( dateCrawled ) ) # create when

        # car age
    getCarAge <- function(month, year){
        dateStr <- paste0(year, "-", month, "-", "15")
        begin <- as.Date( dateStr, "%Y-%m-%d", tz = "CST")
        end <- Sys.Date()
        as.integer( end - begin )
    }

    df$carAge <- with(df, getCarAge(monthOfRegistration, yearOfRegistration) )

        # time on market
    getTimeOnMarket <- function(firstSeen, lastSeen){
        begin <- as.Date(firstSeen)
        end <- as.Date(lastSeen)
        as.integer( end - begin )
    }

    df$timeOnMarket <- with( df,  getTimeOnMarket(dateCreated, lastSeen) )

    # # time to drop the date columns
    df <- subset(df, select = -c(dateCrawled, yearOfRegistration, 
                        monthOfRegistration, dateCreated, lastSeen))


    return(df)
}



