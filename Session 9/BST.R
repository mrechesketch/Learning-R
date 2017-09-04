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

<<<<<<< HEAD
            # prints out a list representation of the object
                repr = function(){
                    leftr < if is.null(left) NULL else left$repr()
                    rightr <- if is.null(right) NULL else right$repr()
                    return( list( node$data, leftr, rightr ) )
                },

=======
>>>>>>> 86f1ede47b9299a0fd4db84942232f6b4b90a5b0
            # tricky templating(?) can be overwritten using inheritance        
                isLess = function(value){
                    return(data < value) # i.e. go right
                },

            # same as above
                isGreater = function(value){
                    return( data > value )
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
                }
            )

            
        )


# tree node constructor
treeNode <- function(data, left, right){
    newTreeNode <-treeNode_$new(data = data, left = left, right = right, size = 0) 
    return(newTreeNode)
}




BST_ <- setRefClass("BST_",

        fields = list(root = "ANY", size = "numeric"),
        
        methods = list(
        
       # =================================== #
            ###### PUBLIC METHODS ####### # THESE GET TESTED!
        # =================================== #

            repr = function(){
<<<<<<< HEAD
                # this structure might help on height..
                # but maybe make more readable.. ternary operator not necessary
                return( if( is.null(root) NULL else root$repr() )
=======
                # notice the structure of
                if( is.null(root) ){
                    return( NULL )
                }
                else{
                    return( reprAtNode(root) )
                }
>>>>>>> 86f1ede47b9299a0fd4db84942232f6b4b90a5b0
            },

        # TODO
            height = function(){
                if( is.null(root)){
                    return(-1)
                }
                else{
                    return(root$height())
                }
            },

        # returns right-most node, helpful for delete!
            max = function(node){
                return( if( is.null(node$right) ) node else max(node$right) )
            },

            exists = function(data){
                if( is.null(root) ){
                    return(FALSE)
                }
                else{
                    return(existsNode(root, data))
                }
            },

            insert = function(data){
                insertAtNode(root, data)
            },

            remove = function(data){
                if( is.null(root) ){
                    return(NULL)
                }
                removeAtNode(root, data)
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

            insertAtNode = function(node, value){
                    if( is.null(node) ){
                        node <- treeNode(data, NULL, NULL)
                    }
                    if( node$isLess(value )){
                        insertAtNode(node$right, value) 
                    }
                    if( node$isGreater(value) ){
                        insertAtNode(node$left, value) 
                    }
            },

            reprAtNode = function(node){
                if( is.null(node) ){ 
                        return(NULL)
                } 
                else{
                    leftr <- reprAtNode(node$left)
                    rightr <- reprAtNode(node$right)
                    return( list( node$data, leftr, rightr ) )
                }
            },

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
            # otherwise assume double parent
                usurper <- node$left$max()
                newLeft <- deleteNode(node$left, usurper$data)
                node <- treeNode(usurper$data, newLeft, node$right)
            }
        )
    )


# constructor function
BST <- function(){
    return( BST_$new( root = NULL, size = 0) )
} 