

node <- function(value, leftTree, rightTree){

    data <- value
    left <- leftTree
    right <- rightTree

    insert <- function(moreData){
        
        goesLeft <- moreData < data
        toInsert <- if( goesLeft ) left else right
        isNull <- is.null(toInsert)

        if( isNull ){
            
            newNode <- node(moreData, NULL, NULL)
            if( goesLeft ) left <<- newNode else right <<- newNode
        } else{
            
            toInsert(moreData)
        }
    }

    function(moreData){
        insert(moreData)
    }

}


getData <- function( node ) environment(node)$data
getLeft <- function( node ) environment(node)$left
getRight <- function( node ) environment(node)$right

printTree <- function(node){
    
    if( !is.null(node) ){
        print( getData(node) )
        printTree( getLeft(node) )
        printTree( getRight(node) )
    }
}

h <- node(5, NULL, NULL)

h(4)
h(10)
h(2)
h(3)
h(8)

printTree(h)