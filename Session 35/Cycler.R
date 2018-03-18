
library("keypress")
library("EBImage")

# arrow key helpers
is.arrowkey <- function(key){
    switch(key, "up" = T, "right" = T, "down" = T, "left" = T, F)
}

is.updown <- function(key){
    assert( is.arrowkey(key) )
    switch(key, "up" = T, "down" = T, F)
}

is.leftright <- function(key) !is.updown(key)



# Cycle function
Cycle <- function(cycleLength, initalValue = 0L){
    # member values
    length <- cycleLength
    value <- initalValue
    # key press logic
    function( direction = keypress() ){ 
        move <- switch(direction, "up" = 1L, "right" = 1L, "down" = -1L, "left" = -1L)
        value <<- move + value
        if( value > length ) value <<- value - length # exceeds max
        if( value < 1 ) value <<- length # less than min        
        value
    }
}

# Define names and their cycles
    # names
directoryNames <- c("../Session 33/src_photos",
                    "../Session 33/truncated_photos",
                    "../Session 34/photos", "../Session 34/output")
directoryContents <- lapply(directoryNames, list.files)
    # cycles
directoryCycle <- Cycle(cycleLength = length(directoryNames))
contentCycles <-  lapply(directoryContents, function(dir) cycleLength = Cycle(length(dir)) )
    # begin the cycle
dc <- directoryCycle("up")
cc <- coqntentCycles[[dc]]("up")

print("hello")
while(TRUE){
    key <- keypress()
    # if( is.arrowkey(key) ) arrowkey.delegate(key)
    switch(key,
    "q" = return(),
    "up" = dc <- directoryCycle(key),
    "down" = dc <- directoryCycle(key),
    "left" = cc <- contentCycles[[dc]](key),
    "right" = cc <- contentCycles[[dc]](key),
    break
    )
    dir <- directoryNames[dc]
    cont <- directoryContents[[dc]][cc]
    fp <- file.path(dir, cont)
    print(fp)
    Image <- readImage(fp)
    dd <- display(Image)
    print(dd)
}

