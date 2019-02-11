gameScores <- c( c(9, 4, 3, 0, 30, 14), 
            c(26, 14, 13, 5, 6, 0),
            c(18, 16, 14, 4, 0, 3),
            c(37, 0, 0, 5, 2, 12),
            c(22, 20, 4, 5, 0, 9) ) # they will all collapse to the same vector don't worry

dnames <- list(
    categories <- c("War", "Commerce", "Technology", "Gold", "Wonders", "Guilds"),
    players <- c("Michele", "Alex", "Nick", "Octavio", "Erika")
)

m <- matrix(gameScores, ncol = 5, nrow = 6, dimnames = dnames) # pretty nice right?

matAve <- function(m) (sum(m))/(length(m))
getROI <- function(m, x, y, len, wid) m[y:(y+len), x:(x+wid)]

partitionFunc <- function(m, x, y, len, wid){
    m <- getROI(m, x, y, len, wid)
    return(matAve(m))
}

constructPath <- function(srcx, srcy, dstx, dsty){
    ## get the magnitude
    deltx <- dstx - srcx
    delty <- dsty - srcy
    ## get the phase (director of vector)
    dirx <- if( deltx <= 0) "W" else "E"
    diry <- if( delty <= 0) "N" else "S"
    ## declare a character vector of correct length
        # get the max length.. need calls to abs?? perhaps.. TODO
    maxLen <- max((abs(deltx)), abs(delty))
        # declare LatMove TODO
    LatMove <- vector(mode="character", length = (maxLen))
        # declare LongMove TODO
    LongMove <- vector(mode="character", length = (maxLen))
    ## fill in the vector
    LatMove[1:abs(deltx)] <- rep(dirx, abs(deltx)) # needs work, TODO
    LongMove[1:abs(delty)] <- rep(diry, abs(delty)) # needs work, TODO
    ## paste0 the vectors together 
    pasted <- paste0(LongMove, LatMove)
    # and return the sample of them
    sample(pasted)
}

dstLoop <- function(m, srcx, srcy, dstx, dsty){
    Path <- constructPath(srcx, srcy, dstx, dsty)
    ValueArray <- numeric(length(Path)+1)
    currentY <- srcy
    currentX <- srcx
    for( i in seq_along(Path)){
        #remember how matrixes index, Y then X
        ValueArray[i] <- m[currentY, currentX]
        instr <- Path[i]
        xmove <- 0; ymove <- 0

        if( grepl("N", instr) ) ymove <- -1
        if( grepl("S", instr) ) ymove <- 1
        if( grepl("E", instr) ) xmove <- 1
        if( grepl("W", instr) ) xmove <- -1
      
        currentY <- currentY + ymove
        currentX <- currentX + xmove
    }
    ValueArray[length(ValueArray)] <- m[currentY, currentX]
    ValueArray
}


# BelousovZhabotinskyFun <- function(m, srcx, srcy, dstx, dsty)

