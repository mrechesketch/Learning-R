



# this function might be helpful for terse incrementations
`incr<-` <- function(value, increment) value + increment


# given a sorted list nums and a number max, determine how many in nums are <= max

# for example: 
#   howMany( c(), 1 ) = 0
#   howMany( 1, 1 ) = 1
#   howMany( 2, 1 ) = 0
#   howMany( c(1:4), 2 ) = 2
#   howMany( c(1:4), 4 ) = 4

howMany <- function(nums, max){
        underMax <- 0
        for(i in seq_along(nums)){
             if( nums[i] <= max){
                 underMax <- underMax+1
             }
        } 
        return(underMax)
}

# and now another function count that does the same, except now max is maxes, a vector

counts <- function(nums, maxes){
        underCount <- numeric(length(maxes))
        for(i in seq_along(maxes)){
            underCount[i] <- howMany(nums, maxes[i])
        }
        return(underCount)
}

# our merge function will take in two sorted lists of numbers
# it will return a combined, sorted list

createTable <- function(nums){
    nums <- sort(nums)
    table <- numeric(nums[length(nums)])
    counter <- 0; nIndex <- 1
    for(i in seq_along(table)){
        while( nums[nIndex] <= i && nIndex <= length(nums) ){
            cat("nIndex is", nIndex, "\n")
            cat("nums[nIndex] is", nums[nIndex], "\n")
            counter <- counter + 1
            nIndex <- nIndex + 1
        }
        table[i] <- counter
    }
    return(table)
}

nums <- c(3, 3, 3, 5, 4, 3, 3, 6, 5)
t<- createTable(nums)

# example 0: merge( c(), c() ) == numeric(0)
# example 1: merge(1, c() ) == c(1)
# example 2: merge(1, 2) == c( 1, 2 )
# example 3: merge( c(1, 4) c(2, 3) ) == c(1, 2, 3, 4)

# merge function
merge <- function(A, B){
    output <- numeric( length(A) + length(B) )
    Acounter <- 1; Bcounter <- 1
    incA <- function() Acounter <<- Acounter + 1
    incB <- function() Bcounter <<- Bcounter + 1
    invalid <- function(AB) is.null(AB) || is.na(AB) 
    for( i in seq_along(output) ){
        # See where you are at
        currentA <- A[Acounter]
        currentB <- B[Bcounter]
        # if NA on A or B, update output accordingly
        if ( invalid(currentA)){
            output[i] <- currentB
            incB() 
        }
        else if (invalid(currentB) ){
            output[i] <- currentA
            incA() 
        } 
        # begin determining order of valid numbers
        else{
            AlessThanB <- currentA < currentB
            output[i] <- if (AlessThanB) currentA else currentB
            if ( AlessThanB ) incA() else incB()
        }
    }
    return(output)
}

