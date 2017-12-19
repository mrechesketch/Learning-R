
simpleVec <- 1:10

sum2 <- function(...) Reduce( function(x,y) x+y, list(...) )

see <- sum2(1,2)
how <- sum2(1:2, c(4,8), 1:0)
this <- sum2(2, c(4,8), 3:0)
works <- sum2(-3, 5, 9, 1:10)