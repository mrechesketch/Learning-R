

max_subarray <- function(array){
    max_ending_here <- max_so_far <- array[1]
    for( x in array[-1] ){
        max_ending_here <- max(x, max_ending_here + x)
        max_so_far <- max(max_so_far, max_ending_here)
    }
    return( max_so_far ) 
}


a1 <- -3:5
a2 <- 0:1
a3 <- -3:-1
a4 <- 1:10