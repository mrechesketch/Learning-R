library(ggplot2)
library(reshape2)

# here is your class of students with their test scores
class <- data.frame(
    s1 = c(9, 9, 4, 8, 7, 3, 10),
    s2 = c(7, 6, 7, 8, 6, 4, 9),
    s3 = c(5, 6, 3, 2, 5, 7, 9),
    s4 = c(3, 4, 2, 6, 8, 9, 9),
    s6 = c(6, 8, 7, 9, 7, 6, 8),
    s7 = c(9, 10, 10, 9, 9, 10, 10)
)

avgs <- apply(class, 2, mean)
stdevs <- apply(class, 2, sd)
## now restructure
avgs <- setNames( melt(avgs), c("Avg.Score") )
stdevs <- setNames( melt(stdevs), c("Score.Stdev") )  # students are row names

## create a plot of each student vs average
    # http://ggplot2.tidyverse.org/reference/geom_abline.html
    # 
avg.ll <- 5.5 # lower limit
avg.ul <- 8.5 # upper limit
avg.target <- 7 # target score

p1 <- ggplot(avgs, aes( x = row.names(avgs), y = Avg.Score)) + 
geom_point() +
geom_hline(yintercept = avg.ll) +
geom_hline(yintercept = avg.ul) +
geom_hline(yintercept = avg.target)

## create a plot of student vs stdev
stdev.ll <- 1 # perfect!!
stdev.ul <- 4 
stdev.target <- 2.5 # kinda arbitrary

