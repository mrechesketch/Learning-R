

Curve_ <- setRefClass(
    "Curve_",
    fields = list(
        zero = "numeric",
        first = "numeric",
        second = "numeric"),
    methods = list(
        getY = function(x){
            return( zero+(first*x)+(second*(x**2) ) )
        }

    )
) 

Curve <- function(x, y, z){
    return(Curve_$new(zero = x, first = y, second = z))
}


# curve constructor test
constructorTest <- function(){
    # coefficients
    A <- 0
    B <- 1  
    C <- 2
    # construction
    myCurve <- Curve(A, B, C)
    # now test member variables
    stopifnot( myCurve$zero == A )
    stopifnot( myCurve$first == B )
    stopifnot( myCurve$second == C )
    # if you get through this then it passed
    print( "Construction Passed" )
}


# get Y test
getYTest <- function(){
    myCurve <- Curve(1, 2, 3)
    # Y = 1 + 2x + 3x**2
    stopifnot( myCurve$getY(0) == 1 ) # Y = 1
    stopifnot( myCurve$getY(1) == 6 ) # Y = 1 + 2 + 3
    stopifnot( myCurve$getY(2) == 17 ) # Y = 1 + 2(2) + 3(4)
    # getY works on a single input
    print( "getY works on single input" )
    # now try a vector input
    stopifnot( myCurve$getY(0:2) == c(1, 6, 17) )
    print( "getY works on a vector input" )
}
#creating a function that will reduce dimentionality while preservin length. Can be used like "sum," but it works like addition 
mySum <- function(...) Reduce(function(x,y) x+y, ...) #looking for anything, in the "..."
yourSum <- function(...) Map(function(x,y) x+y, ...) #looking for x and y