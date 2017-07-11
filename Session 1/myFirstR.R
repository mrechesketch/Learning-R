# taken from http://www.r-tutor.com/r-introduction/list

numeric <- c(2,3,5)
strings <- c("aa", "bb", "cc", "dd", "ee")
booleans <- c(TRUE, FALSE, TRUE, FALSE, FALSE)


ourList <- list(numeric, strings, booleans, 3)
ourVector <- c(numeric, strings, booleans, 3)

# What just happened here? How are these two sequences different??

anotherNumeric <- c(11, 22, 33, 44, 55, 66)
mystery <- anotherNumeric + numeric

# one more experiment!

n <- c(1)
s <- c("hello")
b <- c(TRUE)

test1 <- identical(n[-1], numeric(0))
test2 <- identical(s[-1], numeric(0))
test3 <- identical(b[-1], numeric(0))

test4 <- identical(n[-1], character(0))
test5 <- identical(s[-1], character(0))
test6 <- identical(b[-1], character(0))

test7 <- identical(n[-1], logical(0))
test8 <- identical(s[-1], logical(0))
test9 <- identical(b[-1], logical(0))