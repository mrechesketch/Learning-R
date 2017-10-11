



# this function might be helpful for terse incrementations
`incr<-` <- function(value, increment) value + increment


# given a sorted list nums and a number max, determine how many in nums are <= max

# for example: 
#   howMany( c(), 1 ) = 0
#   howMany( 1, 1 ) = 1
#   howMany( 2, 1 ) = 0
#   howMany( c(1:4), 2 ) = 2
#   howMany( c(1:4), 4 ) = 4

howMany <- function(nums, max)

# and now another function count that does the same, except now max is maxes, a vector

counts <- function(nums, maxes)


# our merge function will take in two sorted lists of numbers
# it will return a combined, sorted list

# example 0: merge( c(), c() ) == numeric(0)
# example 1: merge(1, c() ) == c(1)
# example 2: merge(1, 2) == c( 1, 2 )
# example 3: merge( c(1, 4) c(2, 3) ) == c(1, 2, 3, 4)

# merge function
merge <- function(A, B){
    output <- numeric( length(A) + length(B) )
    Acounter <- 1; Bcounter <- 1
    for( i in seq_along(output) ){
        # See where you are at
        currentA <- A[Acounter]
        currentB <- B[Bcounter]
        # if NA on A or B, update output accordingly
        if ( is.null(currentA) || is.na(currentA) ){
            output[i] <- currentB
            incr(Bcounter) <- 1
        }
        else if ( is.null(currentB) || is.na(currentB) ){
            output[i] <- currentA
            incr(Acounter) <- 1
        } 
        # begin determining order of valid numbers
        else{
            AlessThanB <- currentA < currentB
            output[i] <- if (AlessThanB) currentA else currentB
            if ( AlessThanB ) incr(Acounter) <- 1 else incr(Bcounter) <- 1
        }
    }
    return(output)
}

