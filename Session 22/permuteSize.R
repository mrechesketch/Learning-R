
`%C%` <- function(n, k){
    facTable <- numeric(n)
    return(n)
}

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