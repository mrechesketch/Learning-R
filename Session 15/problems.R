

# NORMALIZATION


#   so far we have seen 2 types of normalization. The first kind we went over a couple weeks ago
#   and that's the one where the sum of the elements in a vector add up to 1
#   that one wasn't too hard because you just divided the vector by it's sum

#   the second type of norm we have seen is the quantum mechanical norm.. This is the one
#   where the sum of the squares must equal one.. and by extension the square root of the sum
#   of squares must also equal 1.

#   the next type of norm is where the max element of the vector must equal 1

#   hence: c(2, 1, 1, 0) would go to c(1, 0.5, 0.5, 0) then 1 + 0.5 + 0.5 + 0 = 2


newNorm <- function(vec) sum(vapply(vec, function(x) x/max(vec), numeric(1)))

problem_1 <- function(){
    vec1 <- c(2, 1, 1, 0)
    vec2 <- c(1:10)
    stopifnot( newNorm(vec1) == 2 )
    stopifnot( newNorm(vec2) == 5.5 )
    print("problem 1 complete")
}

p_norm <- function(p, vec) sum(vapply(vec, function(x) (x**p), numeric(1)))**(1/p)

# TO0)DO, write the p-norm function see norm wiki reading for help


problem_2 <- function(){
    vec1 <- c(2, 1, 1, 0)
    vec2 <- c(1:10)
    stopifnot( p_norm(1, vec1) == 4 )
    # stopifnot( p_norm(4, vec2) == 6333.25 )
    print("problem 2 complete")
}

# NORMALIZATION WITH FUNCTION FACTORIES

# example function factor
exp <- function(pow){
    function(base){
        base**pow
    }
}

sqr <- exp(2)
cube <- exp(3)

stopifnot( sqr(2) == 4 )
stopifnot( cube(2) == 8 )

# TODO make a function factory for pnorm!

pnorm <- function(p){
    function(vec){
        (sum(vec**p))**(1/p)
    }
}



problem_3 <- function(){
    norm1 <- pnorm(1)
    norm2 <- pnorm(2)
    normCustom <- pnorm(6.66)
    stopifnot( norm1(c(1:10)) == 55 )
    stopifnot( norm2(c(1:10)) == 19.62142 )
    stopifnot( normCustom(c(1:10)) == 10.97724)
    print("problem 3 complete!")
}



