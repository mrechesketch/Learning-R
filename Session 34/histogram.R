
library("EBImage")
library("ggplot2")


small <- readImage("photos/small.jpg") # 3 channels 
medium <- readImage("photos/medium.jpg") # b&w (effectively 1 channel)
large <- readImage("photos/large.png") # has 4 channels!!!


# I'm going to do the easy one.. you can do the hard ones and impress me
mediumData <- as.vector(medium[,,1])
mdf <- data.frame(mediumData)
mediumPlot <- ggplot(mdf, aes(mediumData) ) + geom_histogram(bins = 256)
ggsave("output/medium.png", mediumPlot, device = "png")

# in the example I just did there was only ONE channel so it made sense to only have one histogram..


# in the small and large images, you have up to 4 channels!!
# what is a sensisble way to plot these channels simultaneously but also sensibly? 

#small
smallData1 <- as.vector(small[,,1])
smallData2 <- as.vector(small[,,2])
smallData3 <- as.vector(small[,,3])
smallData <- c(smallData1, smallData2, smallData3)
sdf <- data.frame(smallData)
melter <- function(sdf) setNames(melt(sdf), c('smallData1', 'smallData2', 'smallData3'))
smallPlot <- ggplot(sdf, aes(smallData) ) + geom_histogram(bins = 256)
ggsave("output/small.png", smallPlot, device = "png")


#large
largeData1 <- as.vector(large[,,1])
largeData2 <- as.vector(large[,,2])
largeData3 <- as.vector(large[,,3])
largeData4 <- as.vector(large[,,4])
largeData <- c(largeData1, largeData2, largeData3, largeData4)
ldf <- data.frame(largeData)
melter <- function(ldf) setNames(melt(ldf), c('largeData1', 'largeData2', 'largeData3', 'largeData4'))
largePlot <- ggplot(ldf, aes(largeData) ) + geom_histogram(bins = 256)
ggsave("output/large.png", largePlot, device = "png")

