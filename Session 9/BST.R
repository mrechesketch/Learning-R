# we're going to make a BST (Binary Search Tree) yay!

treeNode_ <- setRefClass("treeNode_", 
            
            fields = list(
                # the data the tree holds
                data = "ANY",
                # left and right subtrees 
                left = "ANY", 
                right = "ANY",
                # the size of all the subtrees
                size = "numeric"),

            methods = list(

            # prints out a list representation of the object
                repr = function(){
                    leftr <- if( is.null(left) ) NULL else left$repr()
                    rightr <- if( is.null(right) ) NULL else right$repr()
                    return( list( data, leftr, rightr ) )
                },

            # tricky templating(?) can be overwritten using inheritance        
                isLess = function(value){
                    return(data < value) # i.e. go right
                },

            # same as above
                isGreater = function(value){
                    return( data > value )
                },

                isSame = function(value){
                    return( data == value )
                },

            # node height function
                height = function(){
                    isLeaf <- is.null(left) && is.null(right)
                    isRightSingleDad <- is.null(left) && !isLeaf 
                    isLeftSingleMom <- is.null(right) && !isLeaf
                    if(isLeaf){ #if the node has no children
                        return(0)
                    }
                    if(isRightSingleDad){ #if the node has children only to the right
                        return(1 + right$height()) 
                    }
                    if(isLeftSingleMom){ #if the node has children only to the left
                        return(1 + left$height())
                    }
                    return(1 + max(left$height(), right$height())) #if the node has children on both sides
                },

            # TODO READ AND UNDERSTAND WHY THIS WORKS AND NOT INSERT AT NODE
                add = function(value){
                    
                    # node is greater, add to the left
                    if( isGreater(value) ){
                        if( is.null(left) ){
                            # HINT IT HAS TO DO WITH THE DOUBLE <<-
                            left <<- treeNode(value, NULL, NULL)
                        }
                        else{
                            left$add(value)
                        }
                    }
                    
                    # node is less, add to the right
                    if( isLess(value) ){
                        if( is.null(right) ){
                            right <<- treeNode(value, NULL, NULL)
                        }
                        else{
                            right$add(value)
                        }
                    }
                },

                delete = function(value){
                    return(NULL)
                }


            )

            
        )


# tree node constructor TODO
treeNode <- function(data, left, right){
    
    # we need to handle size correctly
    leftSize <- if( is.null(left) ) 0 else 0 # TODO "else 0" is not correct.. what goes here??
    rightSize <- 0 # TODO same shit. you need to fix this!
    parentSize <- 1 # TODO hint: a parents size is 1 + the size of it's children 

    newTreeNode <-treeNode_$new(
        data = data, left = left, 
        right = right, size = parentSize) 
    
    return(newTreeNode)
}




BST_ <- setRefClass("BST_",

        fields = list(root = "ANY", size = "numeric"),
        
        methods = list(
        
       # =================================== #
            ###### PUBLIC METHODS ####### # THESE GET TESTED!
        # =================================== #

        # returns a list (LIST) representation of the tree
        # where repr = list(data, leftTree, rightTree)
            repr = function(){
                # notice the structure of
                if( is.null(root) ){
                    return( NULL )
                }
                else{
                    return( root$repr() )
                }
            },

        # returns the height (NUMERIC) of the tree
        # by taking the max of the child node heights
            height = function(){
                if( is.null(root)){
                    return(-1)
                }
                else{
                    return(root$height())
                }
            },

        # returns right-most node, helpful for delete!
        # returns TREENODE
            max = function(node){
                return( if( is.null(node$right) ) node else max(node$right) )
            },

        # sees if a piece of data exists
        # returns BOOLEAN
            exists = function(data){
                if( is.null(root) ){
                    return(FALSE)
                }
                else{
                    return(existsNode(root, data))
                }
            },

        # VOID function 
        # inserts a piece of data into the tree
            insert = function(value){
                #insertAtNode(root, data)
                if( is.null(root) ){
                    root <<- treeNode(value, NULL, NULL)
                }
                else{
                    root$add(value)
                }
            },

        # VOID function 
        # removes a piece of data from tree
            remove = function(value){
                if( is.null(root) ){
                    root <<- NULL
                }
                else if( root$isSame(value) ){
                    root <<- NULL
                }
                else{
                    #deleteNode(root, data)
                    root$delete(value)
                }
            },

        # =================================== #
            ###### PRIVATE METHODS #######
        # =================================== #

            existsNode = function(node, value){
                    # you went to far.. waaah
                    if( is.null(node) ){
                        return(FALSE)
                    }
                    if( node$isLess(value )){
                        return( existsNode(node$right, value) ) # node is less, go right
                    }
                    if( node$isGreater(value) ){
                        return( exists(node$left, value) ) # node is more, go left
                    }
                    # otherwise assume equality 
                    return( TRUE )
            },

        # graveyarded
            # insertAtNode = function(node, value){
            #         if( is.null(node) ){
            #             node <- treeNode(data, NULL, NULL)
            #         }
            #         else if( node$isLess(value )){
            #             insertAtNode(node$right, value) 
            #         }
            #         else if( node$isGreater(value) ){
            #             insertAtNode(node$left, value) 
            #         }
            # },

        # TODO - MAKE REMOVE A MEMBER FUNCTION OF NODE INSTEAD -- EXTRA CREDIT THIS WILL BE DIFFICULT ;)
            deleteNode = function(node, value){
            # find the target
                if( node$isLess(value) ){
                    deleteNode(node$right, value )
                }
                if( node$isGreater(value) ){
                    deleteNode( node$left, value )
                }
            # assume it is found and do work
                isLeaf <- is.null(node$left) && is.null(node$right)
                isRightSingleDad <- is.null(node$left) && !isLeaf
                isLeftSingleMom <- is.null(node$right) && !isLeaf
            # if leaf
                if( isLeaf ){
                    node <- NULL
                }
            # if right single parent
                if( isRightSingleDad ){
                    node <- right
                }
            # if left single parent
                if( isLeftSingleMom){
                    node <- left
                }
                else{
            # otherwise assume double parent
                usurper <- max(node$left)
                newLeft <- deleteNode(node$left, usurper$data)
                node <- treeNode(usurper$data, newLeft, node$right)
                }
            }
        )
    )


# constructor function
BST <- function(){
    return( BST_$new( root = NULL, size = 0) )
} 