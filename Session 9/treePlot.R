
source("BST.R")
library("ggplot2")

myTree <- BST()
howMany <- 25
randomNumbers <- runif(howMany, 0, 1) # 25 random numbers between 0 and 1

for(i in 1:howMany){
    myTree$insert(randomNumbers[i])
}

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

height <- getHeights(myTree$root)
size <-getSizes(myTree$root)
value <- getValues(myTree$root)

dataFrame <- data.frame(height, size, value) 

valueAsXHeightAsY <- function(){
    p <- ggplot(dataFrame, aes(value, height) ) + geom_point() 
    p <- p + labs(
    x = "Value of BST", 
    y = "Height of BST" ) 
    return(p)
}
