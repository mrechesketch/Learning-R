#R version 3.3.2 
  


# pr1: reverse the vector
pr1 <- function(someVector) someVector[length(someVector):1]

pr1 <- function(someVector){
    lengthVar <- length(someVector)
    for( i in 1:(lengthVar/2)){
        tempVar <- someVector[i]
        someVector[i] <- someVector[lengthVar-(i-1)]
        someVector[lengthVar-(i-1)] <- tempVar  
    }
}


# pr2: return all elements with count >1 (hint: use a factor-table combination)
pr2 <- function(someVector){
        lengthVec <- length(someVector)
        someTable <- table(someVector)[table(someVector)>1]
        someVector <- names(someTable)
        # someVecFrame <- as.data.frame(someVecTable)
        # someVector <- subset( someVecFrame, Freq > 1)
        return( someVector )
}



vec1 <- 1:10
vec2 <- c('a', 'a', 'b', 'c', 'c', 'd')
vec3 <- c(T, F, T, F, T, F, T, F, F)



pr1Tests <- function(){
    vec1Ans <- 10:1
    vec2Ans <- c('d', 'c', 'c', 'b', 'a', 'a')
    vec3Ans <- c(F, F, T, F, T, F, T, F, T)
    stopifnot( pr1(vec1) == vec1Ans )
    print("pr1 passes vec1")
    stopifnot( pr1(vec2) == vec2Ans )
    print("pr1 passes vec2")
    stopifnot( pr1(vec3) == vec3Ans )
    print("pr1 passes vec3")
}

pr2Tests <- function(){
    vec1Ans <- integer(0)
    vec2Ans <- c('a', 'c')
    vec3Ans <- c(F, T)
    stopifnot( pr2(vec1) == vec1Ans )
    print("pr2 passes vec1")
    stopifnot( pr2(vec2) == vec2Ans )
    print("pr2 passes vec2")
    stopifnot( pr2(vec3) == vec3Ans )
    print("pr2 passes vec3")
}

cat("\n")
pr1Tests()
cat("\n")
pr2Tests()
