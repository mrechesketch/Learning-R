# get that good good x2
library(ggplot2)
library(reshape2)


# Seven Wonders Scores I made up
gameScores <- c( c(9, 4, 3, 0, 30, 14), 
            c(26, 14, 13, 5, 6, 0),
            c(18, 16, 14, 4, 0, 3),
            c(37, 0, 0, 5, 2, 12),
            c(22, 20, 4, 5, 0, 9) ) # they will all collapse to the same vector don't worry

players <- c("michele", "alex", "nick", "octavio", "erika")
categories <- c("war", "commerce", "technology", "coin", "wonder", "guild")


m <- matrix(gameScores, ncol = 5)

# Your first task should be to give your matrix some names:
    # pay attention to the length of the vectors and # of columns in m
    # hint.. colnames and rownames (2 lines)

# I created a melter function to help (1 line)

# Create two plots: one by category and the other by player (2 lines)


