args <- commandArgs(TRUE)

itcont <- args[1]
perc <- args[2]
output <- args[3]


# main <- function(...){
#     args <- list(...)
#     for( item in args ) print(item)

# }

INPUT <- "../insight_testsuite/temp/input/itcont.txt"

########################
# CONST VARIABLES #

CMTE_ID <- 1
NAME <- 8
ZIP_CODE <- 11 # only first 5
TRANSACTION_DT <-14
TRANSACTION_AMT <- 15 
OTHER_ID <- 16 # needs to be empty

RESOURCES <- "../resources"



nameZipPaste <- function(line){
    uniqueID <- paste0(line[8], line[11])
    return(uniqueID)
}
#this is the key to our hashmap
pipeSplitr <- function(input){
    con <- file(input, "r")
        while( TRUE ){
            line <- readLines(con, n=1)
            if ( length(line) == 0 ) break
            line <- strsplit(line, "\\|")[[1]]
            print(nameZipPaste(line))
    }
    close(con)

}

# no magic numbers
NUMBER <- 1
TOTAL_MONEY <- 2
DONS <- 3
HIST <- 4


newPerson <- function(donation){
    # index guide
    # #, $, donations, histogram
    return(list(
        1L,
        donation,
        c(donation),
        c(1L)
    ))
}

updatePerson <- function(donation, Person){
    i <- 1L
    # insert the donation in order
    while(i <= Person[[NUMBER]]){
        pastDonation <- Person[[DONS]][i]
        # easy case, add to histogram
        if( donation == pastDonation ){
            Person[[HIST]][i] <- Person[[HIST]][i]+1L
            return(Person)
        }
        # new donation case
        if( donation < pastDonation ) break
        i <- i+1L
    }
    # new donation case continued
    Person[[DONS]] <- append(Person[[DONS]], donation, after = i-1)
    Person[[HIST]] <- append(Person[[HIST]], 1L, after = i-1)
    # update the other members
    Person[[NUMBER]] <- Person[[NUMBER]]+1L
    Person[[TOTAL_MONEY]] <- Person[[TOTAL_MONEY]]+donation 
    return(Person)
}




# sample person
carl <- newPerson(35)
carl <- updatePerson(15, carl)
carl <- updatePerson(50, carl)
carl <- updatePerson(20, carl)
carl <- updatePerson(40, carl)
# carl <- updatePerson(50, carl)
# carl <- updatePerson(20, carl)
# carl <- updatePerson(40, carl)




# TODO <<- 
# a couple things
        # we don't need to be setting Person[[index]] to anything
        # DONS is an integer whole value is 3 (See line 46)
        # the quantile function returns a vector of length prob (in this case 11)
        #   we are looking for a single value
    # re-read the wiki page: https://en.wikipedia.org/wiki/Percentile
    # follow their example which has been reproduced above for Carl
    # test out your code!! 
    # cd donation-analytics/src
    # r
    # source("donation-analytics.r")
    # calculate(carl)

# calculate function
PERC <- 0.30 # 30th percentile

calculate <- function(Person){
    index <- ceiling( PERC * Person[[NUMBER]] ) # take the ceiling, not the floor
    for( i in 1:Person[[NUMBER]] ){
        # TODO: write your magic here!
    } 
    return( Person[[dons]][index] )
}


main <- function(input, percent, output){
    # open the input
    con <- file(input, "r")
        while( TRUE ){
        line <- readLines(con, n=1)
        if ( length(line) == 0 ) break
        print(line)
    }
    print(percent)
    print(output)
    
}

if( !interactive() ){
    main(itcont, perc, output)
}


# encoding zip code and name into file extensions


splitter <- function(zipcode, name){
    zipVec <- strsplit(zipcode, split = "")[[1]]
    names <- strsplit(name, split = ", ")[[1]]
    lastVec <- strsplit(names[1], split = "")[[1]]
    filename <- paste0(names[2], ".RData")
    # zipPaste <- paste0(zipList, collapse = "/")
    # paste0(zipPaste, "/", name, ".RData")
    list(path = c(zipVec, lastVec),  name = filename )
}

# takes in the output of the above
# turns it into an extension
extentioner <- function(splitList){
    path <- paste0(splitList$path, collapse = "/")
    file.path(RESOURCES, path, splitList$name)
}

searchAndCreate <- function(donation, zipcode, name){
    splittee <- splitter(zipcode, name)
    extention <- extentioner(splittee)
    if( file.exists(extention)){
        load(extention)
        p <- updatePerson(donation, get("p"))
    }
    else{
        path <- RESOURCES
        for(char in splittee$path){
            path <- file.path(path, char) # add chars one at a time
            if( !file.exists(path) ) dir.create(path)
            print(path)
        }
        p <- newPerson(donation)
    }
    save(p, file = extention)

}