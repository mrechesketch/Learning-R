

testNumVec <- c(3, 88, 92, 30, 11, 55, 3, 88, 2, 30, 46)
testStringVec <- c("carrot", "k", "molly", "cardboard", "axel", "banana")

# write a function that only does operations to even indices 


plus3 <- function(n){
    return(n+3)
}

operateEven <- function(vec, fun){
    len <- length(vec)
    for( i in 1:len){
        if(i %%2 == 0){ 
        vec[i] <- fun(vec[i])
        }
    }
    return(vec)
}

exercise_1 <- function(){
    numVec <- c(3, 91, 92, 33, 11, 58, 3, 91, 2, 33, 46)
    stringVec <- c("carrot", "K", "molly", "CARDBOARD", "axel", "BANANA")
    stopifnot( operateEven(testNumVec, plus3) == numVec )
    stopifnot( operateEven(testStringVec, toupper) == stringVec)
    print("exercise 1 complete")
}

# put a Filter on it!

# filter testNumVec so that all the elements are greater than 69

greaterThan69 <- function(N){
    return( N>69 )
}

#Capital F for vectors, little f for data frames

vec_1 <- Filter(greaterThan69, testNumVec)
vec_2 <- Filter(function(x) x>69, testNumVec) # do it again but with an anonymous function


vec_3 <- Filter(function(x) grepl("c", x), testStringVec) # filter testStringVec so that all elements must contain the character "c" 
# HINT, use grepl(needle, haystack)

exercise_2 <- function(){
    over_69 <- c(88, 92, 88)
    has_c <- c("carrot", "cardboard")
    stopifnot( vec_2 == over_69 )
    stopifnot( vec_3 == has_c )
    print("exercise 2 complete") 
}