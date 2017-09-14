source("BST.R")
source("../Session 7/Stack.R") 
# new trick learned @ https://stackoverflow.com/questions/30997667/source-file-in-project-from-different-folder-in-r
library("ggplot2")

# spokeNode extends treeNode
spookyNode_ <- setRefClass("spookyNode_",
                
                contains = "treeNode_",

                fields = list(
                    phase = "numeric",
                    magnitude = "numeric"
                ),

                methods = list(

                    spookChildren = function(){ 

                        if ( !is.null(right) ) {
                            
                            legUp <- height()-right$height()
                            legSide <- data - right$data
                            
                            right$magnitude <<- (legUp**2 + legSide**2)**.5 
                            right$phase <<- atan2(legUp,legSide)

                            right$spookChildren()

                        }
                        if ( !is.null(left) ) {
                            legUp <- height()-left$height()
                            legSide <- data - left$data

                            left$magnitude <<- (legUp**2 + legSide**2)**.5 
                            left$phase <<- atan2(legUp,legSide)

                            left$spookChildren()
                        }
                    }
                )
                      
                        )


# tree node constructor REDEFINED!
treeNode <- function(data, left, right){
    leftSize <- if( is.null(left) ) 0 else left$size
    rightSize <- if( is.null(right) ) 0 else right$size
    parentSize <- 1 + leftSize + rightSize

    newTreeNode <-spookyNode_$new(
        data = data, left = left, 
        right = right, size = parentSize,
        phase = 0, magnitude = 0) 
    
    return(newTreeNode)
}

spookyTree_ <- setRefClass("spookyTree_",
            
            
                contains = "BST_", 

                methods = list(
                    
                    spook = function(){
                        if ( !is.null(root) ) root$spookChildren()
                    },

                    insertRandom = function(N){
                        randums <- runif(N, 0, 1)
                        for(i in 1:N){
                            insert(randums[i])
                        }
                    },

            # returns an inorder data frame of value, size, height, phase, magnitude
                    inOrderDataFrame = function(){

                        values <- numeric(size)
                        sizes <- numeric(size)
                        heights <- numeric(size)
                        phases <- numeric(size)
                        magnitudes <- numeric(size)

                    },


                    plotNRandom = function(){
                        return()
                    }

                )
            
)

spookyTree <- function(){
    return( spookyTree_$new( root = NULL, size = 0) )
} 

