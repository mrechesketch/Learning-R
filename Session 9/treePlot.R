
source("SpookyTree.R")
library("ggplot2")

# Create the spoke tree and add howMany and then spook the children 
myTree <- spookyTree()
howMany <- 500
myTree$insertRandom(howMany)
myTree$spook()

node <- 33
# recursive traversal of the tree to get Values, Sizes, Heights, Phases & Magnitudes
getValues <- function(node){
    if( is.null(node) ){
        return( c() )
    }
    left <- getValues(node$left)
    right <- getValues(node$right)
    return( c(left, node$data, right) )
}

getSizes <- function(node){
    if( is.null(node) ){
        return( c() )
    }
    left <- getSizes(node$left)
    right <- getSizes(node$right)
    return( c(left, node$size, right) )
}

getHeights <- function(node){
    if( is.null(node) ){
        return( c() )
    }
    left <- getHeights(node$left)
    right <- getHeights(node$right)
    return( c(left, node$height(), right) )
}

getPhases <- function(node){
    if( is.null(node) ){
        return( c() )
    }
    left <- getPhases(node$left)
    right <- getPhases(node$right)
    return( c(left, node$phase, right) )
}

getMagnitudes <- function(node){
       if( is.null(node) ){
        return( c() )
    }
    left <- getMagnitudes(node$left)
    right <- getMagnitudes(node$right)
    return( c(left, node$magnitude, right) ) 
}

# now declare the vectors from the functions
height <- getHeights(myTree$root)
size <-getSizes(myTree$root)
value <- getValues(myTree$root)
phase <- getPhases(myTree$root)
magnitude <- getMagnitudes(myTree$root)

# create data frame
dataFrame <- data.frame(height, size, value, phase, magnitude) 

# plotting function 
valueAsXHeightAsY <- function(){
    p <- ggplot(dataFrame, aes(value, height, size = size, colour = height) ) + geom_point() 
    p <- p + labs(x = "Value of BST", y = "Height of BST")
    p <- p + geom_spoke( aes( angle = phase, radius = magnitude) ) 
    return(p)
}



