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
                        
                        node <- root 
                        stack <- Stack()
                        counter <- 1 #counter sets number of rows in matrix 
                        while (!stack$isEmpty() || !is.null(node)){
                            if ( !is.null(node) ){
                                stack$push(node)
                                node <- node$left
                            } else{
                                node <- stack$pop()
                                # time to visit
                                values[counter] <- node$data
                                sizes[counter] <- node$size
                                heights[counter] <- node$height()
                                phases[counter] <- node$phase
                                magnitudes[counter] <- node$magnitude
                                counter <- counter + 1 # increment
                                # final step
                                node <- node$right 
                            }
                        }

                        return( data.frame(heights, sizes, values, phases, magnitudes) )

                    },


                    plotNRandom = function(N){
                        # step 1: insert n random
                        insertRandom(N)
                        # step 2: spook
                        spook()
                        # step 3: get data frame
                        dataFrame <- inOrderDataFrame()
                        # step 4: plot!
                        p <- ggplot(dataFrame, aes(values, heights, size = sizes, colour = heights) ) + geom_point() 
                        p <- p + labs(x = "Value of Node", y = "Height")
                        p <- p + geom_spoke( aes( angle = phases, radius = magnitudes) ) 
                        return(p)
                    }

                )
            
)

spookyTree <- function(){
    return( spookyTree_$new( root = NULL, size = 0) )
} 

