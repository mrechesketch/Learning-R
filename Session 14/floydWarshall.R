edges <- list(

    list( src = '2', dst = '1', w = 4 ),
    list( src = '1', dst = '3', w = -2 ),
    list( src = '2', dst = '3', w = 3 ),
    list( src = '3', dst = '4', w = 2 ),
    list( src = '4', dst = '2', w = -1 )
)



pathExistsTest_0 <- function(){
    # empty list always false
    stopifnot( !pathExists('1', '2', list() ) )
    stopifnot( !pathExists('1', '1', list() ) )
    # no matter the inputs
    print("Empty Test Passed")
}


pathExistsTest_1 <- function(){
    # tests for sameness
    stopifnot( pathExists('1', '1', edges) )
    print("Same test passed")
}

pathExistsTest_2 <- function(){
    # tests for existing edges
    stopifnot( pathExists('2', '1', edges) )
    stopifnot( pathExists('4', '2', edges) )
    print("Exact match test passed")
}

pathExistsTest_3 <- function(){
    stopifnot( pathExists('1', '2', edges) )
    stopifnot( pathExists('4', '3', edges) )
    print("Can traverse the graph!")
}

pathExistsTest_4 <- function(){
    stopifnot( !pathExists('1', '5', edges) )
    print("Nonsense node passed")
}

pathExistsTests <- function(){
    pathExistsTest_0()
    pathExistsTest_1()
    pathExistsTest_2()
    pathExistsTest_3()
    pathExistsTest_4()
}



pathExists <- function(source, destination, edges){
    # edge list is empty, no more
    if (length(edges) == 0){
        return(FALSE)
    }  
    # pop the first off
    current <- edges[[1]]
    edges <- edges[-1]
    # if the current matches or source is destination, path exists
    match <- (current$src == source) && (current$dst == destination)
    same <- source == destination
    if (match || same ) return(TRUE)
    # otherwise keep looking
    pathNoEdge <- pathExists(source, destination, edges)
    pathWithEdge <- pathExists(source, current$src, edges) && pathExists(current$dst, destination, edges)
    return( pathWithEdge || pathNoEdge)
}

shortestPath <- function(source, destination, edges){
    
    if ( length(edges) == 0 ) return(Inf)

    if ( source == destination ) return(0)

    # pop the first element off
    current <- edges[[1]]
    edges <- edges[-1]

    # assume the current edge is not going to be used
    pathNoEdge <- shortestPath(source, destination, edges)

    # assume the current edge will get used    
    useEdge <- min(current$w, shortestPath(current$src, current$dst, edges) ) # there might be a better path farther down the line
    pathWithEdge <- shortestPath(source, current$src, edges) + useEdge + shortestPath(current$dst, destination, edges) 

    return( min(pathWithEdge, pathNoEdge) )
}

