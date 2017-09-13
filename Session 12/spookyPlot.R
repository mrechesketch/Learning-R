# we're working with spoke plots today! i hope your geometery & trig is up to date ;)
library("ggplot2")


rightTrianlge_1 <- function(A, B){
    # define side lengths
    # A <- A
    # B <- B
    C <- (A**2 + B**2)**0.5
    # points
    p1 <- c(A,0)
    p2 <- c(0, 0)
    p3 <- c(0, B)
    # move clockwise starting at p1, use c(angle, magnitude)
    legA <- c(pi, A) # p1 spoke.. goes to the left
    legB <- c(pi/2, B) # p2 spoke.. goes up
    legC <- c( atan2(-B, A), C ) # p3 spoke AKA hypotenuse.. 
    # now bring it all together..
    df <- data.frame( rbind( c(p1, legA), c(p2, legB), c(p3, legC) ) )
    g <- ggplot(df, aes(X1, X2) ) + geom_point() + geom_spoke( aes( angle = X3, radius = X4) )
    return(g)
}

equilateralTriangle <- function(){
    # define the points
    p1 <- c(0, 0)
    p2 <- c(1, 0)
    p3 <- c(0.5, (3**0.5)/2)
    # now define the angle and magnitude
    # start at p1 and move clockwise
    legA <- c(pi/3, 1)
    legB <- c(-pi/3,1)
    legC <- c(pi,1)
    df <- data.frame( rbind( c(p1, legA), c(p3, legB), c(p2, legC) ) )
    g <- ggplot(df, aes(X1, X2) ) + geom_point() + geom_spoke( aes( angle = X3, radius = X4) )
    return(g)
}

