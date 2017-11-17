
`%C%` <- function(n, k){
    stopifnot(n >= 0)
    facTable <- numeric(n+1)
    facTable[1] <- 1
    for( i in 1:(n+1)){
        facTable[i+1] <- i * facTable[i]
    }
    #print(facTable)
    result <- facTable[n+1]/(facTable[k+1]*facTable[n+1-k])
    return(result)
}

intersetingExample <- c("a", "b", "c", "d")



chooseTest_1 <- function(){
    expected <- 210
    actual <- 10 %C% 4
    stopifnot( expected == actual )
    print("10 %C% 4 passed ")
}

chooseTest_2 <- function(){
    expected <- 1
    actual <- 10 %C% 10
    stopifnot( expected == actual )
    print("10 %C% 10 passed ")
}