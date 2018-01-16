
# load the data set from csv (see Session 21/workfile.R )
    # TODO


# drop the uneeded columns (see Session 21/workfile.R... again)
    # TODO


# === don't worry about the below part.. ====
# coerce all factors into character types

# df$abtest <- as.character( df$abtest )
# df$gearbox <- as.character( df$gearbox )
# df$fuelType <- as.character( df$fuelType )
# df$notRepairedDamage <- as.character(df$notRepairedDamage)

# ===== ok you can start worrying again =====


# drop the sparse rows
    # TODO

# functions to encode strings

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
}