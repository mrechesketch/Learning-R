source("PurchaseList.R")


T <- 3

pen <- Purchase('1', 33, NULL)
book <- Purchase('1', 45, NULL)
car <- Purchase('1', 29, NULL)

disc <- Purchase('2', 12, NULL)
ecstasy <- Purchase('2', 10, NULL)
fish <- Purchase('2', 88, NULL)

groupon <- Purchase('3', 99, NULL)
herring <- Purchase('3', 69, NULL)
image <- Purchase('3', 4, NULL)
jackal <- Purchase('3', 56, NULL)
kimono <- Purchase('3', 0.88, NULL)


addSumTest <- function(){
    PL <- PurchaseList(T)
    PL$add(pen)
    stopifnot(PL$sum == 33)
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(PL$sum == 107)
    # add fourth item, should lose the last
    PL$add(disc)
    stopifnot(PL$sum == 86)
}

addSumSqTest <- function(){
    PL <- PurchaseList(T)
    PL$add(pen)
    stopifnot(PL$sqsum == 1089)
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(PL$sqsum == 3955)
    # add fourth item, should lose the last
    PL$add(disc)
    stopifnot(PL$sqsum == 3010)
}

addSizeTest <- function(){
    PL <- PurchaseList(T)
    PL$add(pen)
    stopifnot(PL$size == 1)
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(PL$size == 3)
    PL$add(disc)
    stopifnot(PL$size == 4)
}



runTests <- function(){
    addSizeTest()
    addSumTest()
    addSumSqTest()
    print("PurchaseList Tests Passed!")
}
