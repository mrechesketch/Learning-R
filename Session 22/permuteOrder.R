
# see growHint.R for super literal, line-by-line, demonstrations 
# of what will be occuring in your grow function

# grow is just one part of the dynamic programming solution I am thinking about
# for how to permute order. If you know how to permute the order of all vectors of length N-1
# then you can permute the order for vector of length N

# PARAMS: NUMERIC[] vec 
# OUTPUT: LIST of NUMERIC[]
# BRIEF: grow takes in a numeric vector of length N and returns a list of N+1 numeric vectors
grow <- function( vec ){
    stopifnot(vec > 0)
    Nplus1 <- length(vec)+1 # calculate N+1
    helperVec <- 1:Nplus1 # get our helper vector
    results <- vector("list", Nplus1 ) # allocate space for results
    # TODO SOMETHING HERE.. MAYBE A FOR LOOP?
    for( i in 1:Nplus1 ){
        results[[i]] <- c(helperVec[[i]], vec[[-i]])
        }
    return( results )
}

# grow(1) --> list( c(2,1), c(1,2) )
growTest_1 <- function(){
    expected <- list( 2:1, 1:2 )
    actual <- grow(1)
    pass <- if( is.logical(all.equal(actual, expected)) ) TRUE else FALSE
    stopifnot( pass )
    print( "grow(1) passed ") 
}

# grow( c(1,2) ) --> list( c(3,1,2), c(1,3,2), 3:1 )
growTest_2 <- function(){
    expected <- list( c(3,1,2), c(1,3,2), 3:1 )
    actual <- grow(1:2)
    pass <- if( is.logical(all.equal(actual, expected)) ) TRUE else FALSE
    stopifnot( pass )
    print( "grow(1:2) passed ") 
}


growTest_3 <- function(){
    expected <- list( c(4, 1, 2, 3), c(1, 4, 2, 3), 
                    c(1, 2, 4, 3), c(1, 2, 3, 4) )
    actual <- grow(1:3)
    pass <- if( is.logical(all.equal(actual, expected)) ) TRUE else FALSE
    stopifnot( pass )
    print( "grow(1:3) passed ") 
}

growTests <- function(){
    growTest_1()
    growTest_2()
    growTest_3()
}