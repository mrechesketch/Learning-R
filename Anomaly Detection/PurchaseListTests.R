source("PurchaseList.R")


T <- 3

pen <- Purchase('1', 33)
book <- Purchase('1', 45)
car <- Purchase('1', 29)

disc <- Purchase('2', 12)
ecstasy <- Purchase('2', 10)
fish <- Purchase('2', 88)

groupon <- Purchase('3', 99)
herring <- Purchase('3', 69)
image <- Purchase('3', 4)
jackal <- Purchase('3', 56)
kimono <- Purchase('3', 0.88)



addLenTest <- function(){
    PL <- PurchaseList(T, pen)
    stopifnot(PL$len == 1)
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(PL$len == 3)
}

addSumTest <- function(){
    PL <- PurchaseList(T, pen)
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
    PL <- PurchaseList(T, pen)
    stopifnot(PL$sqsum == 1089)
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(PL$sqsum == 3955)
    # add fourth item, should lose the last
    PL$add(disc)
    stopifnot(PL$sqsum == 3010)
}

addPointerTests <- function(){
    PL <- PurchaseList(T, pen)
    # test constructor
    stopifnot(identical(PL$head$purchase, pen))
    stopifnot(identical(PL$tail$purchase, pen))
    stopifnot(identical(PL$Tth$purchase, pen))
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(identical(PL$head$purchase, car))
    stopifnot(identical(PL$tail$purchase, pen))
    stopifnot(identical(PL$Tth$purchase, pen))
    # add third item
    PL$add(disc)
    stopifnot(identical(PL$head$purchase, disc))
    stopifnot(identical(PL$tail$purchase, pen))
    stopifnot(identical(PL$Tth$purchase, book))
}

runTests <- function(){
    addLenTest()
    addSumTest()
    addSumSqTest()
    addPointerTests()
}
