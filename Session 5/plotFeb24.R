# importing cvs: http://www.r-tutor.com/r-introduction/data-frame/data-import
# sorting names easily: https://stackoverflow.com/questions/17531403/how-to-sort-a-character-vector-where-elements-contain-letters-and-numbers-in-r
# and https://stackoverflow.com/questions/7334644/sort-columns-of-a-dataframe-by-column-name



# install.packages("gtools") ## uncomment if you've already done this!
# install.packages("hperSpec")
    # install.packages("baseline")
    # install.packages("SparseM")
library("gtools")
library("hyperSpec")
require("baseline")


# takes in a csv file location and returns a data frame
getData <- function(filename){
    data <- read.csv(filename)
    orderedNames <- mixedsort(names(data))
    return(data[, orderedNames])
}


# see what str(data) does! how is it represented.. does it look familiar?
feb24 <- getData("Data - Feb24Data.csv")

# data frames operate similarly to vectors!
# get everything but the 1st column >> feb24[-1], AWESOME

# Now lets see some plots.. courtesy of https://www.stat.berkeley.edu/~s133/R-4a.html
plot1 <- function(){
    plot(feb24$Raman.Shift, feb24$sample_1.txt)
}
# or we could also do
plot2 <- function(){
    with(feb24, plot(Raman.Shift, sample_1.txt))
}

# hmm we should address that baseline drift... use the hyperSpec package


feb24 <- t(feb24) # transpose it

wavelengthVector <- feb24[1:1,]
spectraMatrix <- feb24[2:nrow(feb24),]

spchso <- new("hyperSpec", spc = spectraMatrix, wavelength = wavelengthVector, data = NULL)

# this function should basically do what the above lines do..
hyperSpec <- function(dataFrame){
    dataFrame <-t(dataFrame)
    wavelengthVector <- dataFrame[1:1,]
    spectraMatrix <- dataFrame[2:nrow(dataFrame,)]
    spc <- new("hyperSpec", spc = spectraMatrix, wavelength = wavelengthVector, data = NULL)
    return(spc)
}

bl <- baseline (spc [[]], method = "modpolyfit", degree = 4)
spc [[]] <- getCorrected(bl)

offsets1 <- c(-123.3, -124.5, -126.6, -128.2, -130.5, -132.1, -133.9, -135, -136.4, -138.6, -139.3) #6-15
offsets2 <- c(124, 126, 128, 130, 132, 134, 136, 138) #16-23
offsets3 <- c(11.1, 13, 15, 17, 19) #24-28
offsets4 <- c(17.5, 16.5, 15.5, 14.5, 13.5, 12.5, 11.5, 10.5, 9.5) #29-37