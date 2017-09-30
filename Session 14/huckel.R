
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

orbitals <- benzene$vectors <- benzene$vectors * -1 # 


# notice the orbitals already satisfy normalization lol
# normalization here means : https://www.quora.com/What-is-the-meaning-of-normalization-in-quantum-mechanics
# one column of orbitals is a wavefunction. The integration of the squares must == 1
ones <- apply(orbitals, 2, function(x) sum(x**2) )
# first argument is orbitals - this is a matrix
# second argument specifies whether this is done over the rows (1) or columns (2)
# third argument is the function we are applying.. 
#   notice x is a vector NOT an element of the vector
#   this makes sense because we are dealing with a matrix, not a vector
isOne <- function(x) (x > 0.9999999999 && x < 1.000000001)
stopifnot( isOne(ones) )

# lets pretend R wasn't so magical and instead output a matrix that was not normalized

needsWork <- list(
    col1 <- c(-1, 1, -1, 1, -1, 1),
    col2 <- c(1, 1, 1, 1, 1, 1),
    col3 <- c(-1, 0, 1, -1, 0, 1),
    col4 <- c(-1, 1, 0, -1, 1, 0),
    col5 <- c(1, 0, -1, -1, 0, 1),
    col6 <- c(-1, -1, 0, 1, 1, 0)
)

needsWork <- matrix(unlist(needsWork), ncol = length(needsWork), byrow = TRUE)

# this time orbitals (AKA wavefunctions) are held as rows
testWaveFunction <- needsWork[1,] # subset the first row

sumOfSquares <- sum(vapply(testWaveFunction, function(x) x**2, numeric(1)))

stopifnot( sumOfSquares != 1 ) # what is sumOfSquares's value?

# notice if we divide the vector by the sqrt of the sumsq it satisfies the normalization condition

one <- sum( (testWaveFunction / (sumOfSquares**0.5) )**2 )
stopifnot( isOne(one) )

# =================== 2 PROBLEMS ========================== #

# Both of these can (and should) be done in 1 line using apply family functions

# TODO write a function norm2 that acts on a vector and returns the square root ( sum of the squares )
# HINT: see line 81.. it's similar but not totally the same

norm2 <- function(vec) sum(vapply(matrix(unlist(vec), ncol = length(vec), byrow = TRUE))**2)
# TODO 


problem_1 <- function(){
    ans <- 6**0.5
    stopifnot(norm2(testWaveFunction) == ans)
    stopifnot(norm2(needsWork[3,]) == 2)
    stopifnot(norm2(needsWork[2,]) == ans)
    print("problem 1 complete yay")
}

# TODO and now we're going to apply that function over all the rows of the matrix
# HINT: see line 50 where orbitals gets declared
# Move over columns, NOT rows

normalizeMat <- function(mat) sum(vapply(matrix(unlist(mat), nrow = length(mat), byrow = TRUE))**2)

# TODO HERE


problem_2 <- function(){
    normed <- normalizeMat(needsWork)
    ones <- apply(normed, 2, norm2)
    stopifnot( isOne(ones) )
    print("problem 2 complete yay")
}










anotherMoleculeAtoms <- list(
    a1 <- c(2, 1.414, 0, 0, 0, 0, 0),
    a2 <- c(1.414, 0, 1, 0, 0, 0, 0),
    a3 <- c(0, 1, 0, 1, 0, 0, 0),
    a4 <- c(0, 0, 1, 0, 1, 0, 0),
    a5 <- c(0, 0, 0, 1, 0, 1, 0),
    a6 <- c(0, 0, 0, 0, 1, 0, 1),
    a7 <- c(0, 0, 0, 0, 0, 1, 1)
)

anotherMoleculeAdjMat <- matrix(unlist(anotherMoleculeAtoms), ncol = length(anotherMoleculeAtoms), byrow = TRUE)

anotherMolecule <- eigen(anotherMoleculeAdjMat)

