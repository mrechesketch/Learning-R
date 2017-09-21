
# we're gonna get into a lil matrix stuff

# testing on the wiki example: https://en.wikipedia.org/wiki/Diagonalizable_matrix
rowOne <- c(1, 2, 0)
rowTwo <- c(0, 3, 0)
rowThree <- c(2, -4, 2)

testMat <- rbind(rowOne, rowTwo, rowThree)
colnames(testMat) <- c('colOne', 'colTwo', 'colThree')

eigenTest <- eigen(testMat) # yay! things check out.. this "diagonalizes" the matrix

# not to be confused with "diag"

diagonals <- diag(testMat)

# TODO write a function called "trace" that gets the trace of a matrix!
# the trace is the sum of the diagonal elements..

# > PUT IT HERE < 
trace <- function(x) sum(diag(x))


# now re-write diagonal
# use a loop or 

diagLoop <- function(anyMatrix){
    numerics <- numeric(dim(anyMatrix)[1])
    for (i in seq_along(numerics)){
        numerics[i] <- anyMatrix[ i, i]
    }
    return(numerics)
}


diagApply <- function(hisMatrix) vapply((c(1:dim(hisMatrix)[1])), function(x) hisMatrix[ x, x], numeric(1))


#  and now the Huckel Method
benzeneAtoms <- list(
c1 <- c(0, 1, 0, 0, 0, 1),
c2 <- c(1, 0, 1, 0, 0, 0),
c3 <- c(0, 1, 0, 1, 0, 0),
c4 <- c(0, 0, 1, 0, 1, 0),
c5 <- c(0 ,0, 0, 1, 0, 1),
c6 <- c(1, 0, 0, 0, 1, 0)
)

benzeneAdjMat <- matrix(unlist(benzeneAtoms), ncol = length(benzeneAtoms), byrow = TRUE)

benzene <- eigen(benzeneAdjMat)