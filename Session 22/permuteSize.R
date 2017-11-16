
`%C%` <- function(n, k){
    stopifnot(n >= 0)
    facTable <- numeric(n+1)
    facTable[1] <- 0
    for( i in 1:n+1){
        facTable[i] <- (n[i]/(k[i]*(n[i]-k[i])))
    }
    return(facTable)
}

binomNum <- (factorial(n)/(factorial(k)*(factorial(n-k))))

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