
data <- c(0, 0, 0, 3, 0, 0, 0, 10, 
        0, 88, 0, 20, 11, 58, 22, 0, 
        0, 0, 22, 0, 4, 23, 0, 3)

matrix_1 <- matrix(data, nrow = 3, ncol = 8)
matrix_2 <- matrix(data, nrow = 12, ncol = 2)
matrix_3 <- matrix(c(data,0), nrow = 5, ncol = 5)


# for skimMat, you are going to loop through rows and columns 
# of the mat and return a list of coordinates = c(row, col) for values
# that are >= to the thresehold

# for the purpose of this exercise, it is ok to append to a list
# returnList <- append(returnList, appendee) is how it looks

skimMat <- function(mat, thresehold){
    returnList <- list()
    return( returnList )
}