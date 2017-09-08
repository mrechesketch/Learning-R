source("BST.R")



# NODE TESTS

nodeTests <- function(){
    # make left
    left <- treeNode(3, NULL, NULL)
    leftr <- list(3, NULL, NULL)
    # check size height and repr
    stopifnot( left$size == 1 ) # default size
    stopifnot( identical(left$repr(), leftr) ) # default repr
    stopifnot( left$height() == 0 ) # default height
    # make right
    right <- treeNode(8, NULL, NULL)
    rightr <- list(8, NULL, NULL)
    # do root with left n right
    root <- treeNode(5, left, right)
    rootr <- list(5, leftr, rightr)
    # check size, height and repr
    stopifnot( root$size == 3 ) # size
    stopifnot( root$height() == 1 ) # height
    stopifnot( identical(root$repr(), rootr) ) # repr
    print("node tests passed")
}





insertTest <- function(){
    newBST <- BST()
    stopifnot( identical( newBST$repr(), NULL ) )
    newBST$insert(5)
    stopifnot( identical( newBST$repr(), list( 5, NULL, NULL ) ) )
    newBST$insert(3)
    left <- list(3, NULL, NULL)
    stopifnot( identical( newBST$repr(), list( 5, left, NULL ) ) )
    newBST$insert(8)
    right <- list(8, NULL, NULL)
    stopifnot( identical( newBST$repr(), list( 5, left, right ) ) )
    newBST$remove(5)
    stopifnot( identical( newBST$repr(), list(3, NULL, right) ) ) # removal always selects max() of left
    print( "insert test passed" )
}


existsTest <- function(){
    newBST <- BST()
    stopifnot( !newBST$exists(6) ) # test something not in there
    newBST$insert(5)
    stopifnot( !newBST$exists(6) ) # do it again
    stopifnot( newBST$exists(5) ) # 5 should be there
    newBST$remove(5)
    stopifnot( !newBST$exists(5) ) # 5 should not be there
    print( "exists test passed" )
}

removeTest <- function(){


    newBST <- BST()
    # leaf case
    newBST$insert(5) # root
    newBST$remove(5)
    stopifnot( identical(newBST$repr(), NULL) )
    print(" remove leaf passed ")

    # single left case
    newBST$insert(5) # root
    newBST$insert(3) # left
    newBST$remove(5)
    stopifnot( identical(newBST$repr(), list(3, NULL, NULL) ) )
    print(" remove single left parent passed ")


    # single right case
    newBST$insert(5) # root
    newBST$insert(8) # right
    newBST$remove(5)
    stopifnot( identical(newBST$repr(), list(8, NULL, NULL) ) )
    print(" remove single right parent passed ")

    # double parent simple
    newBST$insert(5) # root
    newBST$insert(3) # left
    newBST$insert(8) # right
    newBST$remove(5)
    stopifnot( identical(newBST$repr(), list(3, NULL, list(8, NULL, NULL) ) ) )
    print(" remove double parent passed (simple) ") 


    # double parent harder
    newBST$insert(5) # root
    newBST$insert(3) # left
    newBST$insert(8) # right
    newBST$insert(4) # left $ right
    newBST$insert(2) # left $ left
    newBST$insert(7) # right $ left
    newBST$remove(5) # 4 will usurp
    leftr <- list(3, list(2, NULL, NULL), NULL)
    rightr <- list(8, list(7, NULL, NULL), NULL)
    stopifnot( identical(newBST$repr(), list(4, leftr, rightr) ) )
    print(" remove double parent passed (complex) ")

}

sizeTest <- function(){
    newBST <- BST()
    stopifnot( identical( newBST$repr(), NULL ) )
    newBST$insert(5)
    stopifnot( identical( newBST$repr(), list( 5, NULL, NULL ) ) )
    newBST$insert(3)
    left <- list(3, NULL, NULL)
    stopifnot( identical( newBST$repr(), list( 5, left, NULL ) ) )
    newBST$insert(8)
    right <- list(8, NULL, NULL)
    stopifnot( identical( newBST$repr(), list( 5, left, right ) ) )
    print( "size test passed" )
}

heightTest <- function(){
    newBST <- BST()
    stopifnot( identical( newBST$repr(), NULL ) )
    newBST$insert(5)
    stopifnot( identical( newBST$repr(), list( 5, NULL, NULL ) ) )
    newBST$insert(3)
    left <- list(3, NULL, NULL)
    stopifnot( identical( newBST$repr(), list( 5, left, NULL ) ) )
    newBST$insert(8)
    right <- list(8, NULL, NULL)
    stopifnot( identical( newBST$repr(), list( 5, left, right ) ) )
    # newBST$remove(5)
    # stopifnot( identical( newBST$repr(), list(3, NULL, right) ) ) # removal always selects max() of left
    print( "height test passed" )
}