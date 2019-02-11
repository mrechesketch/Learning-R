
WALL <- "w"
HEAD <- "h"
BODY <- "b"
FOOD <- "x"
EMPTY <- " "



Cell <- setRefClass(

        Class = "Cell",

        fields = list(
            data = "character",
            row = "integer",
            column = "integer"
        ),

        methods = list(

            initialize = function(d, r, c){
                data <<- d
                row <<- r
                column <<- c
            },

            show = function(){
                contents <- paste0("(",data,",",row,",",column,")")
                cat("Cell:",contents, "\n")
            },

            # get Coordinates
            getRow = function() row,
            getCol = function() column,

            # get contents of cell
            getData = function() data,
            
            # set AND get contents of cell
            setData = function(value){
                oldData <- getData()
                data <<- value
                oldData # overwrites BUT ALSO returns old data
                # similar to if push and pop were combined..
            },

            # specific to types
            setHead = function() setData(HEAD),
            setBody = function() setData(BODY),
            setEmpty = function() setData(EMPTY),
            setFood = function() setData(FOOD),

            # boolean checkers
            isHead = function() getData() == HEAD,
            isBody = function() getData() == BODY,
            isWall = function() getData() == WALL,
            isEmpty = function() getData() == EMPTY,
            isFood = function() getData() == FOOD 

        )
)