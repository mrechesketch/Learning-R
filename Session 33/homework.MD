## PROBLEM 0: MD PREVIEW

I worked hard on this _beautiful_ markdown homework so please **admire** it by opening it in preview.  

## PROBLEM 1: BOX PLOTS!

Familiarize yourself with the [geom_boxplot() function!](http://ggplot2.tidyverse.org/reference/geom_boxplot.html). Work in the boxplot.R file to create some pictures! I will leave you some samples of what your plots should look like. Please source your code and make sure it runs and creates the picture you want it to. From the Learning-R directory...

    cd Session\ 33
    r
    source("boxplot.R")


Your homework isn't complete until you have created a plot and saved it! (Saving it is easy, you can file > save as from the plot window).


## PROBLEM 2: DITHERING!!!

Hopefully we can finish the donation-analytics quickly (or maybe just take a break from it because it was a beat down last time). Instead, I want to try out [dithering](https://en.wikipedia.org/wiki/Dither)! I read about this a while ago and thought it was super cool. We are going to dither an image using the [Floyd Steinberg algorithm](https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering). I will choose an image before we meet but I also encourage you to find your own.

To do this we will use the EBImage library and to use that we need bioconductor. 
Run these lines and hopefully nothing terrible happens...

    source("http://bioconductor.org/biocLite.R")
    biocLite("EBImage")
    library("EBImage") # if you can run this, it works!

(Many) images are held in 3 channels RGB (or HSV if you are feeling polar). The EBImage library lets you index into these frames by holding 3 matrices of pixels. We are going to dither each of these frames. Please familiarize yourself with the package and how to index to each of the frames.. The dream is to implement this algorithm in a **very R way** i.e. _no loops, only apply and vectorized operations_ 