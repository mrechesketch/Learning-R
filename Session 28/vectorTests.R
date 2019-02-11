source("FRList.R")
source("v.R")


# =========================================================================== #
# ========================== FRList Tests =================================== #

constructorTestsFR <- function(){
    default <- FRList()
    stopifnot( default$size == 0 ) # size is 0
    stopifnot( default$contents == NULL ) # no contents
    stopifnot( default$type == "list" ) # default type is list
    intList <- FRList("integer")
    stopifnot( intList$type == "integer" ) 
    print("FR constructor test passed!")
}

push_backTestsFR <- function(){
    default <- FRList()
    for( i in 1:10 ) default$push_back(i)
    stopifnot( default$size == 10 )
    for( i in 1:10 ) stopifnot( default$contains(i) )
    print("FR push_back test passed!")
}

pop_backTestsFR <- function(){
    intList <- FRList("integer")
    for( i in 1:10L ) intList$push_back(i)
    for(i in 10:1L ){
        popped <- intList$pop_back()
        stopifnot( popped == i )
        stopifnot( intList$size == (i-1L) ) # check size as it is decreased
    }
    stopifnot( intList$contents == NULL ) # there should be no contents
    print("FR pop_back test passed!")
}