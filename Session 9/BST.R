

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

            # parentage helper functions
                isLeaf = function(){
                    return( is.null(left) && is.null(right) )
                },

                isLeftSingleMom = function(){
                    return( !is.null(left) && is.null(right) )
                },

                isRightSingleDad = function(){
                    return( !is.null(right) &&  is.null(left) )
                },
            

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
                    if( isLeaf() ){ #if the node has no children
                        return(0)
                    }
                    if( isRightSingleDad() ){ #if the node has children only to the right
                        return(1 + right$height()) 
                    }
                    if( isLeftSingleMom() ){ #if the node has children only to the left
                        return(1 + left$height())
                    }
                    return(1 + max( c(left$height(), right$height()) ) ) #if the node has children on both sides
                },

            # TODO READ AND UNDERSTAND WHY THIS WORKS AND NOT INSERT AT NODE
                add = function(value){

                    size <<- size + 1
                    
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
                }

            #     delete = function(value){
            #     # in the case of going right...
            #     if( isLess(value) ){
            #         if(right$isSame(value)){
            #         # if leaf
            #             if( right$isLeaf() ){
            #                 right <<- NULL
            #             }
            #         # if right single parent
            #             else if( right$isRightSingleDad() ){
            #                 right <<- right$right
            #             }
            #         # if left single parent
            #             else if( right$isLeftSingleMom() ){
            #                 right <<- right$left
            #             }
            #             else{
            #         # otherwise assume double parent
            #             usurper <- max(right$left)
            #             newLeft <- right$left$delete(usurper$data)
            #             right <<- treeNode(usurper$data, newLeft, right$right)
            #             }
            #         }
            #         else{
            #             right$delete(value)
            #         }

            #     }
            #     # in the case of going left
            #     if( isGreater(value) ){
            #         if(left$isSame(value)){
            #         # if leaf
            #             if( left$isLeaf() ){
            #                 left <<- NULL
            #             }
            #         # if right single parent
            #             else if( left$isRightSingleDad() ){
            #                 left <<- left$right
            #             }
            #         # if left single parent
            #             else if( left$isLeftSingleMom() ){
            #                 left <<- left$left
            #             }
            #             else{
            #         # otherwise assume double parent
            #             usurper <- max(left$left)
            #             newLeft <- left$left$delete(usurper$data)
            #             left <<- treeNode(usurper$data, newLeft, left$right)
            #             }
            #         }
            #         else{
            #             left$delete(value)
            #         }
            #     }

            # }
            )

            
        )


# tree node constructor TODO
treeNode <- function(data, left, right){
    leftSize <- if( is.null(left) ) 0 else left$size
    rightSize <- if( is.null(right) ) 0 else right$size
    parentSize <- 1 + leftSize + rightSize

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
                # add to size of tree
                size <<- size + 1
                #insertAtNode(root, data)
                if( is.null(root) ){
                    root <<- treeNode(value, NULL, NULL)
                }
                else{
                    root$add(value)
                }
            },

        # # VOID function 
        # # removes a piece of data from tree
        #     remove = function(value){
        #         print("remove started")
        #         if( root$isSame(value) ){
        #             print("root is same")
        #         # if leaf
        #             if( root$isLeaf() ){
        #                 print("root was leaf")
        #                 root <<- NULL
        #             }
        #         # if right single parent
        #             else if( root$isRightSingleDad() ){
        #                 print("root was sright")
        #                 root <<- root$right
        #             }
        #         # if left single parent
        #             else if( root$isLeftSingleMom() ){
        #                 print("root was sleft")
        #                 root <<- root$left
        #             }
        #             else{
        #                 print("root was dp")
        #             # otherwise assume double parent
        #                 usurper <- max(root$left)
        #                 newLeft <- root$left$delete(usurper$data)
        #                 root <<- treeNode(usurper$data, newLeft, root$right)
        #             }
        #         }
        #         else{
        #             root$delete(value)
        #         }
        #     },

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

deleteMemberFunction = function(node, value){

}

