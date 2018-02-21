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


NewPerson <- function(donation){
    # index guide
    # #, $, donations, histogram
    return(list(
        1L,
        donation,
        c(donation),
        c(1L)
    ))
}

upDatePerson <- function(donation, Person){
    Person[[NUMBER]] <- Person[[NUMBER]]+1L
    Person[[TOTAL_MONEY]] <- Person[[TOTAL_MONEY]]+donation
    # is there an equivalet donation in the array already?
    i <- 1L
    while(donation <= Person[[DONS]][i] && i <= Person[[NUMBER]]){
        if( donation == Person[[DONS]][i] ){
            # easy case, add to histogram
            Person[[HIST]] <- Person[[HIST]]+1L
            return(Person)
        }
        i <- i+1L
    }
    print( i - 1)
    Person[[DONS]] <- append(Person[[DONS]], donation, after = i-1)
    Person[[HIST]] <- append(Person[[HIST]], 1L, after = i-1) 
    return(Person)
}



# sample person
# carl <- NewPerson(35)
# carl <- upDatePerson(15, carl)
# carl <- upDatePerson(50, carl)
# carl <- upDatePerson(20, carl)
# carl <- upDatePerson(40, carl)

carl <- list(
    5,
    160,
    c(15,20,35,40,50),
    c(1,1,1,1,1)
)


# TODO <<- 

# calculate function
PERC <- 0.30 # 30th percentile

calculate <- function(Person){
    index <- ceiling( perc * Person[[NUMBER]] ) # take the ceiling, not the floor
    return( Person[[index]] )
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
