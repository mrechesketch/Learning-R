
TABLE_SOURCE <- "tables-csv"


# exercise_1:

# print the name of the file and the contents of the table
# line by line

printr <- function(){
    for(i in dir(TABLE_SOURCE)){
        print(i)
        filePath <- paste0(TABLE_SOURCE, "/", i)
        con <- file(filePath, "r")
        while( TRUE ){
            out <- readLines( con, n = 1 )
            if( length(out) == 0 ) break
            print( out )
        }
        close( con ) # on.exit was not working
        cat("\n")
    }
}




# exercise_2: 

# we want to hold the character table as a matrix
# return the table as a matrix


PointGroup <- function(pgName){
    # create filepath 
    filePath <- paste0(TABLE_SOURCE, "/", pgName, ".csv")
    # read the csv as a data frame minding the left column
    df <- read.csv(filePath, row.names = 1)
    # convert data frame to data matrix
    dm <- data.matrix(df)
    #getting rid of unwanted Xs and weird character replacements 
    # invalid names are prefixed with X, remove the X
    colnames(dm) <- sub("X", "", colnames(dm))
    # invalid characters are converted to ., remove that as well
    colnames(dm) <- sub("\\.", "'", colnames(dm))
    return( dm )
}


# exercise_3:

# get the order of the group: sum the coefficients of all the symmetry elements
# you will also want to write a coefficients function

# example...
# > o <- PointGroup("O")
# > o
#   E 8C3 3C2 6C4 6C2' <----- these are the coefficients you are after
#   A1 1   1   1   1    1
#   A2 1   1   1  -1   -1
#   E  2  -1   2   0    0
#   T1 3   0  -1   1   -1
#   T2 3   0  -1  -1    1
# > colnames(o)
# [1] "E"    "8C3"  "3C2"  "6C4"  "6C2'" 
# > coef(o)
# [1] 1 8 3 6 6
# > order(o)
# [1] 24

# HINT: for this problem I would use a regex match function
# that finds the leading number of a string 
# I would suggest using a look-ahead https://stackoverflow.com/questions/6109882/regex-match-all-characters-between-two-strings
# if there is no leading number, return 1, otherwise
# convert the string-number match into a number!

extract <- function(patt, string) regmatches(string, regexpr(patt, string, perl = T) ) # this function should help

leadingNumber <- function(string){ 
    string <- extract("\\d+(?=\\w)", string)
    if( identical(character(0), string)){
        return(1)
    }
    return( as.integer(string) )
}


coef <- function(pgMatrix) sapply(colnames(pgMatrix), leadingNumber)

order <- function(pgMatrix) return(sum(coef(pgMatrix)))

# write another order function that just takes in the name of the point group
# use the method outlined by Curnow 
# http://www.chem.canterbury.ac.nz/graphics/researchgroup/owen_curnow_group/Method%20for%20determining%20point%20group%20order.pdf


orderFromName <- function(pgName){
    letterValue <- c("C" = 1, "S" = 1, "D" = 2, 
                "T" = 12, "O" = 24, "I" = 60)
    BigLetter <- extract("C|S|D|T|O|I", pgName)
    NumberLetter <- extract("\\d+", pgName)
    LittleLetter <- extract("s|v|d|h|i", pgName)
    #makes sure its working
    #cat(BigLetter, NumberLetter, LittleLetter, "\n")
    if( identical(NumberLetter, character(0)) ){
        NumberLetter <- 1
    }else{
        NumberLetter <- as.numeric(NumberLetter)
    }
    if( identical(LittleLetter, character(0))){
        LittleLetter <- 1
    } else{
            LittleLetter <- 2
        }
    return(as.vector(letterValue[BigLetter]) *NumberLetter*LittleLetter)
}

# exercise_4:

# REDUCIBLE REPRESENTATION REDUCTION!!!!
# http://www.l4labs.soton.ac.uk/tutorials/gt/reduction.
# http://ckw.phys.ncku.edu.tw/public/pub/Notes/Mathematics/GroupTheory/Tung/Powerpoint/ChemSoc/PredictingSpectra/reduction_formula.htm

loadTable <- function(pgName){
    # load the table as a matrix
    pointGroup <- PointGroup(pgName)
    # it's a closure!
    function( reducibleRep ){
        # assign variables to coefficients, order 
        coefs <- coef(pointGroup)
        h <- order(pointGroup)
        # consider applying a function over the rows of the pgMatrix
        apply(pointGroup, 1, function(row) sum(row*coefs*reducibleRep)/h)
        # https://stackoverflow.com/questions/4236368/apply-a-function-to-every-row-of-a-matrix-or-a-data-frame 
    }
}

# for C3v
red_1 <- c(3, 0, 1)

# for D3h
red_2 <- c(5, 2, 1, 3, 0, 3)

#MAGIC PROOF RESULTS
# 2*d3h["A1'", ]+ d3h["A2''",] + d3h["E'",]
#    E  2C3 3C2'   sh  2S3  3sv
#    5    2    1    3    0    3

# test yourself by comparing your results to NH3 and PF6 (found on the 2nd link)  

# the above function only needs to return the coefficients of the irreps (A1, A2, B1, E, etc.. )
# hence for C3v (the point group of NH3) the reduction of c(3, 0, 1) would return c(1, 0 ,1)

