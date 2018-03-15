
library("EBImage")
library("ggplot2")
library("reshape2")


small <- readImage("photos/small.jpg") # 3 channels 
medium <- readImage("photos/medium.jpg") # b&w (effectively ] channel)
large <- readImage("photos/large.png") # has 4 channels!!!


# I'm going to do the easy one.. you can do the hard ones and impress me
mediumData <- as.vector(medium[,,1])
mdf <- data.frame(mediumData)
mediumPlot <- ggplot(mdf, aes(mediumData) ) + geom_freqpoly(bins = 256)
ggsave("output/medium.png", mediumPlot, device = "png")

# in the example I just did there was only ONE channel so it made sense to only have one histogram..


# in the small and large images, you have up to 4 channels!!
# what is a sensisble way to plot these channels simultaneously but also sensibly? 

#small
smallData1 <- as.vector(small[,,1])
smallData2 <- as.vector(small[,,2])
smallData3 <- as.vector(small[,,3])
#smallData <- c(smallData], smallData2, smallData3)
sdf <- data.frame(smallData1, smallData2, smallData3)
smallm <- melt(sdf, id.vars = NULL, variable.name = "Channel")
smallPlot <- ggplot(smallm, aes(value, color = Channel) ) + geom_freqpoly(bins = 256)
ggsave("output/small.png", smallPlot, device = "png")


#large
largeData1 <- as.vector(large[,,1])
largeData2 <- as.vector(large[,,2])
largeData3 <- as.vector(large[,,3])
largeData4 <- as.vector(large[,,4])
# largeData <- c(largeData], largeData2, largeData3, largeData4) use the data frame method
ldf <- data.frame(largeData1, largeData2, largeData3, largeData4)
#remember this way to filter
ldf[ldf ==1 | ldf == 0] <- NA
ldf <- na.omit(ldf)
largel <- melt(ldf, id.vars = NULL, variable.name = "Channel")
largePlot <- ggplot(largel, aes(value, color = Channel) ) + geom_histogram(bins = 254)
ggsave("output/large.png", largePlot, device = "png")

