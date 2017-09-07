

testNumVec <- c(3, 88, 92, 30, 11, 55, 3, 88, 2, 30, 46)
testStringVec <- c("carrot", "k", "molly", "cardboard", "axel", "banana")

# write a function that only does operations to even indices 


plus3 <- function(n){
    return(n+3)
}

operateEven <- function(vec, fun){
    return(vec)
}

exercise_1 <- function(){
    numVec <- c(91, 33, 58, 91, 33)
    stringVec <- c("K", "CARDBOARD", "BANANA")
    stopifnot( operateEven(testNumVec, plus3) == numVec )
    stopifnot( operateEven(testStringVec, toupper) == stringVec)
    print("exercise 1 complete")
}

# put a Filter on it!

# filter testNumVec so that all the elements are greater than 69

greaterThan69 <- function(N){
    return( N>69 )
}

vec_1 <- Filter( greaterThan69, testNumVec)
vec_2 <- Filter(greaterThan69, testNumVec) # do it again but with an anonymous function


vec_3 <- c() # filter testStringVec so that all elements must contain the character "c" 
# HINT, use grepl(needle, haystack)

exercise_2 <- function(){
    over_69 <- c(88, 92, 88)
    has_c <- c("carrot", "cardboard")
    stopifnot( vec_2 == over_69 )
    stopifnot( vec_3 == has_c )
    print("exercise 2 complete") 
}




