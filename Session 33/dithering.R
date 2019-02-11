# source("http://bioconductor.org/biocLite.R")
# biocLite("EBImage")
library("EBImage") # if you can run this, it works!



# lets assume we are moving from 24bit color to 8 bit color
# https://en.wikipedia.org/wiki/8-bit_color

# color palletes
mRG <- 15; RG <- 0:mRG/mRG
mB <- 7; B <- 0:mB/mB



# closest color function / truncating function
findClosestColor <- function(numberOfBits){
    maxBits <- (2**numberOfBits)-1
    colorPallete <- (0:maxBits)/maxBits
    function(inputPixelValue){
         # assume input pixel value is 0-1
        index <- round(inputPixelValue*maxBits) # round to nearest integer
        colorPallete[index+1] # index into new color pallete
    }
}

# closure
findClosestRG <- findClosestColor(numberOfBits = 3)
findClosestB <- findClosestColor(numberOfBits = 2)



truncateRG <- function(m) apply(m, 2, findClosestRG) 
truncateB <- function(m) apply(m, 2, findClosestB) 



truncateImage <- function(imageName){
    #read image
    Image <- readImage(file.path("src_photos", imageName))
    imageData(Image)[,,1] <- truncateRG(imageData(Image)[,,1])#truncated red
    imageData(Image)[,,2] <- truncateRG(imageData(Image)[,,2])  #truncating green
    imageData(Image)[,,3] <- truncateB(imageData(Image)[,,3]) #truncating blue
    Image
}

ditherRG <- function(mat){
# for each y from top to bottom
    for(y in 1:(nrow(mat)-1)){
        #    for each x from left to right
        for( x in 2:(ncol(mat)-1)){
#       oldpixel  := pixel[x][y]
            oldpixel <- mat[y,x]
        #newpixel  := find_closest_palette_color(oldpixel)
            newpixel <- findClosestRG(oldpixel)
#       pixel[x][y]  := newpixel
            mat[y,x] <- newpixel
#       quant_error  := oldpixel - newpixel
            quant_error <- oldpixel - newpixel      
        #calculations
            mat[y    , x + 1] <- mat[y    , x + 1] + quant_error * 7 / 16
            mat[y + 1, x - 1] <- mat[y + 1, x - 1] + quant_error * 3 / 16
            mat[y + 1, x    ] <- mat[y + 1, x    ] + quant_error * 5 / 16
            mat[y + 1, x + 1] <- mat[y + 1, x + 1] + quant_error * 1 / 16
        }
    }
    return(mat)
}

ditherB <- function(mat){
        for(y in 1:(nrow(mat)-1)){
        #    for each x from left to right
        for( x in 2:(ncol(mat)-1)){
        #oldpixel  := pixel[x][y]
            oldpixel <- mat[y,x]
        #newpixel  := find_closest_palette_color(oldpixel)
            newpixel <- findClosestB(oldpixel)
        #pixel[x][y]  := newpixel
            mat[y,x] <- newpixel
        #quant_error  := oldpixel - newpixel
            quant_error <- oldpixel - newpixel      
        #calculations
            mat[y    , x + 1] <- mat[y    , x + 1] + quant_error * 7 / 16
            mat[y + 1, x - 1] <- mat[y + 1, x - 1] + quant_error * 3 / 16
            mat[y + 1, x    ] <- mat[y + 1, x    ] + quant_error * 5 / 16
            mat[y + 1, x + 1] <- mat[y + 1, x + 1] + quant_error * 1 / 16
        }
    }
    return(mat)
}

imageName <- "large.png"
Image <- truncateImage(imageName)
writeImage(Image, file.path("truncated_photos", imageName) )#file path we save to
# Image <- readImage("src_photos/large.png")
# imageData(Image)[,,1] <- ditherRG(imageData(Image)[,,1])
# imageData(Image)[,,2] <- ditherRG(imageData(Image)[,,2])
# imageData(Image)[,,3] <- ditherB(imageData(Image)[,,3])
# writeImage(Image,'TruncatedFiles')

ditherImage <- function(image){
    imageData(image)[,,1] <- ditherRG(imageData(image)[,,1])
    imageData(image)[,,2] <- ditherRG(imageData(image)[,,2])
    imageData(image)[,,3] <- ditherB(imageData(image)[,,3])
    image
}

di <- ditherImage(Image)