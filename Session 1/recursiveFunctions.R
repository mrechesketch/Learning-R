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


coins <- c(1,12,15,42,25)



change <- function (amount, coins){
    if (length(coins) == 0) {
        return(amount==0)
    }
    useIt = change(amount-coins[1],coins[-1] )
    loseIt = change(amount,coins[-1])
    return(useIt || loseIt)
}

changeTest1 = identical(change(38, c(1, 12, 15, 42, 25)), TRUE)
changeTest2 = identical(change(37, c(1, 12, 15, 42, 25)), TRUE)
changeTest3 = identical(change(0, c()), TRUE)
changeTest4 = identical(change(1, c()), FALSE)
changeTest5 = identical(change(36, c(1, 2, 3, 25)), FALSE) 

maxRec <- function(numVec){
    if (length(numVec)==0){
        return(c())
    if (is.Null(numVec)){
        return(c())
    if (numVec[i] < numVec[i-n]){
        return(c(numVec[i+n],  maxRec(numVec[-1])))
    }
    if (numVec[i] == numVec[i-n]){
        return(c(numVec[i+n],  maxRec(numVec[-1])))
    }
    if (!is.Null(numVec[-1])){
        return(c(numVec[i+n],  maxRec(numVec[-1])))
    }
    return(c(maxRec(numVec[-1])))
    }
}

passFail <- function(x, y) if (x == y) "PASS" else "FAIL"
customVec <- c(3, 55, 4, 77, 32)

cat("\n")
print("maxRec Tests")
t1 <- maxRec(1)
t2 <- maxRec(1:10)
t3 <- maxRec( customVec )
cat("the output of maxRec(1) is:", t1, passFail(t1, 1), "\n" )
cat("the output of maxRec(1:10) is:", t2, passFail(t2, 10), "\n" )
cat("the output of maxRec( c(3, 55, 4, 77, 32) ) is:", t3, passFail(t3, 77), "\n" )