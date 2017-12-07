source("Curve.R")

CurveClass <- set.ref.class(
    "Curve_",
    fields = list(
        A = "numeric",
        B = "numeric",
        C = "numeric"),
    Methods(
        GetY = Function(x){
            return(A, B*x, Cx**2)
        }

    )
) 

Curve <- function(){
    return(Curve_$new(len = 0, head = NULL))
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
    stopifnot( myCurve$A == A )
    stopifnot( myCurve$B == B )
    stopifnot( myCurve$C == C )
    # if you get through this then it passed
    print( "Construction Passed" )
}


# get Y test
getYTest <- function(){
    myCurve <- Curve(1, 2, 3)
    # Y = 1 + 2x + 3x**2
    stopifnot( myCurve$getY(0) == 1 ) # Y = 1
    stopifnot( myCurve$getY(1) == 6 ) # Y = 1 + 2 + 3
    stopifnot( myCurve$getY(2) == 16 ) # Y = 1 + 2(2) + 3(4)
    # getY works on a single input
    print( "getY works on single input" )
    # now try a vector input
    stopifnot( myCurve$getY(0:2) == c(1, 6, 16) )
    print( "getY works on a vector input" )
}