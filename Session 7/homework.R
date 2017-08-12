
################################################################
#                 Splitting Vectors                            #
################################################################

# from the coding challenge...

# given a numeric vector with elements (out of order) 1 through N
# return the the list split into 3 *equal* sized vectors

# a freebie example :-)
split2 <- function(numVec){
    len <- length(numVec)
    stop <- floor(len/2) # what does floor do? try it out for yourself in the interpreter!
    return( list( numVec[1:stop], numVec[(stop+1):len]) )
}

# now do 3 and 4

split3 <- function(numVec){
    # TODO
    return(list())
}


split4 <- function(numVec){
    # TODO
    return(list())
}


# TESTS FOR SPLIT FUNCTIONS 

testSplit2 <- function(){
    stopifnot( identical( split2(c(1:100)), list(c(1:50),c(51:100)) ) )
    stopifnot( identical( split2(c(1:101)), list(c(1:50),c(51:101)) ) )
}

testSplit3 <- function(){
    threeVec <- c(2,3,1)
    fourVec <- c(4,2,3,1)
    fiveVec <- c(5,4,2,3,1)
    stopifnot( identical(split3(threeVec), list( c(2), c(3), c(1))) )
    stopifnot( identical(split3(fourVec), list( c(4), c(2), c(3,1))) )
    stopifnot( identical(split3(fiveVec), list( c(5), c(4,2), c(3,1))) )
}

# TODO write tests for split4
testSplit4 <- function(){
    stopifnot( identical(0,0) )
}

# extra credit.. split a vector into a list of N *equal* sized vectors
# maybe consider a loop for this problem.. 
splitN <- function(numVec, N){
    len <- length(numVec)
    stopifnot(len >= N) # you can't split a 3 element list into 4 parts... 
    return(list())
}

