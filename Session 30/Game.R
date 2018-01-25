#install.packages("keypress")
library("keypress")
source("Board.R")
source("S4v.R")


Game <- setRefClass(
    Class = "Game",

    fields = list(
        Board = "ANY",
        Snake = "ANY",
        direction = "character",
        lose = "logical"
    ),

    methods = list(

        initialize = function(){
            # Game elements
            Board <<- Board(H = 30L, W = 60L)
            # set up the snake
            startRow <- Board$height/2; startCol <- Board$width/2
            headCell <- Board$getItem(startRow, startCol); headCell$setHead() 
            bodyCell_1 <- Board$getItem(startRow, startCol-1); bodyCell_1$setBody()
            bodyCell_2 <- Board$getItem(startRow, startCol-2); bodyCell_2$setBody()
            Snake <<- S4v(list(headCell, bodyCell_1, bodyCell_2))
            # default direction
            direction <<- "right"
            lose <<- FALSE
        },

        advance = function(){
            headCell <- Snake$getItem(1)
            # determine the next cell
            nextRow <- headCell$getRow() + switch(direction, down = 1, up = -1, 0)
            nextCol <- headCell$getCol() + switch(direction, right = 1, left = -1, 0)
            nextCell <- Board$getItem(nextRow, nextCol)
            for( i in seq_along(Snake) ){
                prevCell <- Snake$getItem(i)
                currentData <- prevCell$getData()
                nextData <- nextCell$setData(currentData)
                if( nextData == WALL ) lose <<- TRUE # case where you hit a wall
                if( nextData == HEAD || nextData == BODY ) lose <<- TRUE # case where you hit snake
                Snake$setItem(i, nextCell)
                prevCell$setEmpty()
                nextCell <- prevCell
            }
        }

        # advance = function(){
        #     switch(direction,
        #     up = goUp(),
        #     down = goDown(),
        #     right = goRight(),
        #     left = goLeft())
        # }
    )
)

g <- Game()
cycler <- 0

while( !g$lose ){
    g$Board$show()
    cat("\n")
    if( cycler == 5 ) g$advance()
    if( cycler == 10 ) cycler <- 0
    cycler <- cycler + 1
}



# # begin main interaction loop
# lose = FALSE

# while( !lose ){
#     b$show()

# }


