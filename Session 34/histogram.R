
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






