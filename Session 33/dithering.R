library("EBImage") # if you can run this, it works!


# lets assume we are moving from 24bit color to 8 bit color
# https://en.wikipedia.org/wiki/8-bit_color

# color palletes
mRG <- 15; RG <- 0:mRG/mRG
mB <- 7; B <- 0:mB/mB



# closest color function
findClosestColor(numberOfBits){
    if(numberOfBits == 3){
        # red green case
        maxValue <- mRG
        newColorPallete <- RG 
    } else {
        maxValue <- mB
        newColorPallete <- B
    }
    function(inputPixelValue){
         # assume input pixel value is 0-1
        newColorPallete <- 0:maxValue/maxValue # create color pallete
        index <- round(inputPixelValue*maxValue) # round to nearest integer
        newColorPallete[index] # index into new color pallete
    }
}

# closure
findClosestRG <- findClosestColor(numberOfBits = 3)
findClosestB <- findClosestColor(numberOfBits = 2)