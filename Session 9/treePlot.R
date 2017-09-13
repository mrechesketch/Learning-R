
source("SpookyTree.R")
library("ggplot2")

myTree <- spookyTree()
myTree$insertRandom(250)
myTree$spook()

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

height <- getHeights(myTree$root)
size <-getSizes(myTree$root)
value <- getValues(myTree$root)
phase <- getPhases(myTree$root)
magnitude <- getMagnitudes(myTree$root)

dataFrame <- data.frame(height, size, value, phase, magnitude) 

valueAsXHeightAsY <- function(){
    p <- ggplot(dataFrame, aes(value, height, size = size) ) + geom_point() 
    p <- p + labs(x = "Value of BST", y = "Height of BST")
    p <- p + geom_spoke( aes( angle = phase, radius = magnitude) ) 
    return(p)
}

#valueAsXSizeAsY <- 

