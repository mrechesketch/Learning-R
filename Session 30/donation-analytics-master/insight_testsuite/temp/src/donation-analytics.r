args <- commandArgs(TRUE)

itcont <- args[1]
perc <- args[2]
output <- args[3]


# main <- function(...){
#     args <- list(...)
#     for( item in args ) print(item)

# }

INPUT <- "temp/input/itcont.txt"

########################
# CONST VARIABLES #

CMTE_ID <- 1
NAME <- 8
ZIP_CODE <- 11 # only first 5
TRANSACTION_DT <-14
TRANSACTION_AMT <- 15 
OTHER_ID <- 16 # needs to be empty

pipeSplitr <- function(input){
    con <- file(input, "r")
        while( TRUE ){
            line <- readLines(con, n=1)
            if ( length(line) == 0 ) break
            result <- strsplit(line, "|")
            print(result)
    }

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
