# Seven Wonders Scores I made up
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
melter <- function(g) setNames(melt(g), c('Categories', 'Players', 'Scores'))
mm <- melter(m)

# here is that bunky game data I made up a couple weeks ago

    # try to imitate my bar plots ;)




