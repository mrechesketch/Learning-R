source("Cell.R")



Board <- setRefClass(
        Class = "Board",

        fields = list(
            # dimensions
            width = "integer",
            height = "integer",
            board = "matrix"
        ),

        methods = list(

            initialize = function(H, W){
                height <<- H
                width <<- W
                cells <- vector("list", width*height)
                isTopOrBottom <- function(row) row == 1L || row == height
                isLeftOrRight <- function(col) col == 1L || col == width
                cells <- lapply(1:(height*width),
                        function(index){
                            r <- ( (index-1L) %/% width ) + 1L
                            c <- index - ( width * (r-1L) )
                            #cat("r is: ", r, "and c is: ", c, "index is: ", index, "\n")
                            data <- if( isTopOrBottom(r) || isLeftOrRight(c) ) WALL else EMPTY
                            Cell(data, r, c)
                        }  )
                board <<- matrix(data = cells, nrow = height, ncol = width, byrow = TRUE)                
            },

            asString = function(){
                dispRow <- function(row) vapply(row, 
                function(cell) cell$getData(), FUN.VALUE = "character")
                rowStrings <- apply(board, 1, function(x) dispRow(x) )
                addNewLine <- cbind(rowStrings, rep("\n", height))
                # Reduce(function(x,y) paste0(x,y),
                # t(addNewLine))
            },

            show = function(){
                dispRow <- function(row) vapply(row, 
                function(cell) cell$getData(), FUN.VALUE = "character")
                displayed <- apply(board, 1, function(r) cat(dispRow(r), "\n")) 
            },

            getItem = function(row, col) board[[row, col]]
        )
)