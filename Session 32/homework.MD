## Problem 1: Check out dis Markdown

I didn't realize this until last week at some point but you can preview .md files in MS VS Code by selecting the little preivew option in the top right corner of the editor window (it's next to the split-screen editor). Here is a [link](https://code.visualstudio.com/docs/languages/markdown) in case you need help.

## Problem 2: Calculate the nearest percentile

We didn't talk about the calculate function last time! Oops. You will get another shot at it this week. I will give you some pseudo-code here which will hopefully give you better guidance.

Consider Carl who has made has made the donations 
    
    donations <- c(15,20,35,40,50)

Lets assume the easy case where he has only made one donation of each amount. If you are asked to calculate the 40th percentile of his donations, you would...

    # first find the index
    index <- ceiling(0.40 * 5) # we have 5 donations
    # index is now = 2
    # now we return donations[2]
    return( donations[2] ) # which is 20

This is example is outlined on the [wiki page](https://en.wikipedia.org/wiki/Percentile) I keep linking.

Now lets consider a bit more complicated case for Jane. Jane matches Carl's donations and donates another (separate) $10 everytime his donations exceed $40. Jane's donations look something like this:

    donations <- c(10,10,15,35,40,50)
    # however this is not the way we talked about representing donations
    dons <- c(10,15,20,35,40,50)
    hist <- c(2,1,1,1,1,1)
    # we keep a unique vector of donations called dons
    # and a separate vector of donation-counts called hist
    index <- ceiling(0.40 * 7) # index = 3
    # and now our calculate function should return the same value as donations[index]
    # donations[index] = 15
    # except we need to get this number using dons and hist NOT the donations vector.
    # if we start at hist[1] we have 2 donations (which correspond to the 2 times Jane donated $10)
    # index - hist[1] = 1.. We keep going
    # now index = 1
    # index - hist[2] = 0.. looks like it's time to stop!
    # return dons[2]


Let's consider another case for Gus. Gus is rich.

    dons <- c(15,20,35,40,50)
    hist <- c(1,1,2,3,5)
    index <- ceiling(0.40 * 12) # = 5
    # now we step 5 deep into hist..
    5 - 1 = 4 # hist[1] = 1
    4 - 1 = 3 # hist[2] = 1
    3 - 2 = 1 # hist[3] = 2
    2 - 3 = -1  # hist[4] = 3
    # index is now = -1... looks like we made it
    return( dons[4] ) # which is = 40

To write this function you will want a loop. A for loop that moves over the length of the hist (or dons) vector should be good. I left you some structure on the calculate function. Fill in the inside of the loop.  


CalcPerc <- function(dons, hist, p){
    index <- ceiling(p * length(dons))
    i <- 1
    while(index - hist[i] > 0){
        index <- index - hist[i]
        if(index - hist[i] == 0) break
        i <- i + 1
        }
    return(dons[i])
}