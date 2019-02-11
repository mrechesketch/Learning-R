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

m <- matrix(gameScores, ncol = 5, nrow = 6)

#mats <- lapply(vecs, function(v) matrix(v, nrow = 10, ncol = 10) )

# Your first task should be to give your matrix some names:
    # pay attention to the length of the vectors and # of columns in m
    # hint.. colnames and rownames (2 lines)
rownames(m) <- c("war", "commerce", "technology", "coin", "wonder", "guild")
colnames(m) <- c("michele", "alex", "nick", "octavio", "erika")

# I created a melter function to help (1 line)

# Create two plots: one by category and the other by player (2 lines)

#HWP <- ggplot(m, aes(col, row)) + geom_boxplot()

#geom_boxplot(mapping = NULL, data = NULL, stat = "boxplot",
  #position = "dodge", ..., outlier.colour = NULL, outlier.color = NULL,
  #outlier.fill = NULL, outlier.shape = 19, outlier.size = 1.5,
  #outlier.stroke = 0.5, outlier.alpha = NULL, notch = FALSE,
  #notchwidth = 0.5, varwidth = FALSE, na.rm = FALSE, show.legend = NA,
  #inherit.aes = TRUE)

## help
## https://stackoverflliow.com/questions/26838760/convert-matrix-to-three-column-data-frame

# mats <- lapply(m, function(g) matrix(g, nrow = 5, ncol = 6) )

## help
## https://stackoverflliow.com/questions/26838760/convert-matrix-to-three-column-data-frame

melter <- function(g) setNames(melt(g), c('categories', 'players', 'scores'))


meltPlot <- function(g) ggplot(g, aes(categories, scores)) + geom_boxplot()