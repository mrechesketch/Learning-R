# computes a triangle number 
triangleNumber <- function(n){
    if (n == 1) {
        return(1)
    }
    return(n + triangleNumber(n-1))
}

tNumUgly <- function(n, tail){
    if (n == 1) {
        return(1+tail)
    }
    return(tNumUgly(n-1, n+tail))
}

tNum <- function(n){
    return(tNumUgly(n, 0))
}


# computes the length of a sequence
len <- function(sequence){
    if (length(sequence)==0) {
        return(0)
    }
    return(1 + len(sequence[-1]))
}

# creates a list 
evensOnly <- function(numVec){
    if (length(numVec)==0){
        return(c())
    }
    if (numVec[1] %% 2 == 0){
        # it is divisible by 2, append!
        return(c(numVec[1], evensOnly(numVec[-1])))
    }
    else{
        return(evensOnly(numVec[-1]))
    }
}

pyramid <- function(n){
    if (n == 0) {
        return(c())
    }
    return(c(tNum(n), pyramid(n-1)))
}

test1 <- identical( pyramid(0), c() )
test2 <- identical( pyramid(1), c(1))
test3 <- identical( pyramid(5), c(15,10,6,3,1))

odd <- function(n){
    return(!even(n))
}
even <- function(n){
    if (n == 0) {
        return(TRUE)
    }
    if (n == 1) {
        return(FALSE)
    }
    return(odd(n-1))
}


test4 <- identical( even(0), TRUE)
test5 <- identical( even(1), FALSE)
test6 <- identical( even(2), TRUE)
test7 <- identical( odd(0), FALSE)
test8 <- identical( odd(1), TRUE)
test9 <- identical( odd(2), FALSE)

