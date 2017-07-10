# computes a triangle number 
triangleNumber <- function(n){
    if (n == 1) {
        return(1)
    }
    return(n + triangleNumber(n-1))
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