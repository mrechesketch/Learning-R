source("BST.R")

# spokeNode extends treeNode
spokeyNode_ <- setRefClass("spokeyNode_",
                
                contains = "treeNode_",

                fields = list(
                    phase = "numeric",
                    magnitude = "numeric"
                ),

                methods = list(

                    spookChildren = function(){
                        print("set!")
                    }
                )
                      
                        )


# tree node constructor REDEFINED!
treeNode <- function(data, left, right){
    leftSize <- if( is.null(left) ) 0 else left$size
    rightSize <- if( is.null(right) ) 0 else right$size
    parentSize <- 1 + leftSize + rightSize

    newTreeNode <-spokeyNode_$new(
        data = data, left = left, 
        right = right, size = parentSize,
        phase = 0, magnitude = 0) 
    
    return(newTreeNode)
}