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
                    leftr < if is.null(left) NULL else left$repr()
                    rightr <- if is.null(right) NULL else right$repr()
                    return( list( node$data, leftr, rightr ) )
                },

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
            # TODO!
            # remember a single node has height = 0
            # and a node's height is the max of it's children
                }
            )

            
        )


# tree node constructor
treeNode <- function(data, left, right){
# TODO WRITE THIS PLEASE
    return( list( data, left, right) )
}




BST_ <- setRefClass("BST_",

        fields = list(root = "ANY", size = "numeric"),
        
        methods = list(
        
       # =================================== #
            ###### PUBLIC METHODS ####### # THESE GET TESTED!
        # =================================== #

            repr = function(){
                # this structure might help on height..
                # but maybe make more readable.. ternary operator not necessary
                return( if( is.null(root) NULL else root$repr() )
            },

        # TODO
            height = function(){
                # remember.. empty tree is height = -1
                # tree with 1 node is height 0
                # and so on...
                return(-1)
            },

        # returns right-most node, helpful for delete!
            max = function(node){
                return( if( is.null(node$right) ) node else max(node$right) )
            },

            exists = function(data){
        # TODO
                return(FALSE)
            },

            insert = function(data){
                insertAtNode(root, data)
            },

            remove = function(data){
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
                        return( exists(node$right, value) ) # node is less, go right
                    }
                    if( node$isGreater(value) ){
                        return( exists(node$left, value) ) # node is more, go left
                    }
                    # otherwise assume equality 
                    return( TRUE )
            },

            insertAtNode = function(node, value){
        # TODO!
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