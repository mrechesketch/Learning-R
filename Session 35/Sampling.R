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

partitionFunc <- function(m, x, y, len, wid)){
    m <- getROI(m, x, y, len, wid))
    return(matAve(m))
}

constructPath <- function( srcx, srcy, dstx, dsty){
    deltx <- srcx - dstx
    delty <- srcy - dsty

    dirx <- if( deltx <= 0) "W" else "E"
    diry <- if( delty <= 0) "N" else "S"
    
    LatMove <- rep(dirx, abs(dirx))
    LongMove <- rep(diry, abs(diry))
    paste0()
}

dstLoop <- function(m, srcx, srcy, dstx, dsty)


BelousovZhabotinskyFun <- function(m, srcx, srcy, dstx, dsty)

