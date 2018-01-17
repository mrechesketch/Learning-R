
# load the data set from csv (see Session 21/workfile.R )
    # TODO
source("dataTreatment.R")

writeCarData <- function(){
    filename <- "used_cars-small.csv"
    data <- read.csv(filename)

# drop the uneeded columns (see Session 21/workfile.R... again)
    # TODO
    cat(filename, "is read in", "\n")
    # data filtering step
    ocols <- ncol(data) # keep track
    keeps <- c("dateCrawled", "price", "abtest", "yearOfRegistration", 
                    "gearbox", "powerPS", "kilometer", "monthOfRegistration", 
                    "fuelType", "notRepairedDamage", "dateCreated", "lastSeen")
    data <- data[keeps] # keep only good columns
    ncols <- ncol(data)
    cat(ocols - ncols, "columns have been dropped", "\n")
    # write to a new file
    




# === don't worry about the below part.. ====
# coerce all factors into character types

# df$abtest <- as.character( df$abtest )
# df$gearbox <- as.character( df$gearbox )
# df$fuelType <- as.character( df$fuelType )
# df$notRepairedDamage <- as.character(df$notRepairedDamage)

# ===== ok you can start worrying again =====


# drop the sparse rows
    # TODO
    data <- within(data, X <- ifelse(is.na(X), 0, X))
    data[rowSums(0 == data) != ncol(data),]

# functions to encode strings
    #case 1
#makeBinary <- function(x){
    #x <-encodeString(x, 2)
#}

    data$abtest[data$test] <- 1L 
    data$abtest[data$scontrol] <- -1L 

    data$gearbox[data$manuell] <- 1L 
    data$gearbox[data$automatik] <- -1L 

    data$fuelType[data$benzin] <- 1L 
    data$fuelType[data$diesel] <- -1L 

    data$notRepairedDamage[data$ja] <- 1L 
    data$notRepairedDamage[data$nein] <- -1L 

    #case2
    #dates
    firstSeen <- today - dateCrawled 
    lengthOfPost <- lastSeen - dateCreated
    ageOfCar <- today - monthOfRegistration

    #numbers along a scale
#numScale <- function(x){
    #maxs <- apply(x, 3, max)
    #mins <- apply(x, 3, min)
    #scale(x, center=(maxs+mins)/3, scale=(maxs-mins)/3)
#}
    maxs <- apply(firstSeen, 3, max)
    mins <- apply(firstSeen, 3, min)
    scale(firstSeen, center=(maxs+mins)/3, scale=(maxs-mins)/3)

    maxs <- apply(lengthOfPost, 3, max)
    mins <- apply(lengthOfPost, 3, min)
    scale(lengthOfPost, center=(maxs+mins)/3, scale=(maxs-mins)/3)

    maxs <- apply(ageOfCar, 3, max)
    mins <- apply(ageOfCar, 3, min)
    scale(a, center=(maxs+mins)/3, scale=(maxs-mins)/3)

    # abtest
encodeABTest <- function(aORb) switch(aORb, test = 1, control = -1, NA) # last value is default

    # gearbox TODO

    # fuelType TODO

    # notRepairedDamage TODO


# date related functions

    # car age
getCarAge <- function(month, year){
    # TODO
    return()
}

    # time on market
getTimeOnMarket <- function(firstSeen, lastSeen){
    begin <- as.Date(firstSeen, "%Y-%m-%d %h:%m:%s")
    end <- as.Date(lastSeen, "%Y-%m-%d %h:%m:%s")
    end - begin
    #end of cleaning
    newFilename <- "goodUsed_cars-small.csv"
    write.csv(data, newFilename, row.names=F)
    cat("data has been written to: ", filename, "\n")
}