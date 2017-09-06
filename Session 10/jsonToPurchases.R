library("rjson") # https://cran.r-project.org/web/packages/rjson/rjson.pdf
library("ggplot2") # hadley wickham is bae <3

# our good ol purchase class
Purchase_ <- setRefClass("Purchase_",

    fields = list(
        purchaser = "character", amount = "numeric", 
        amountsq = "numeric", timestamp = "character"),
    
    methods = list(

        getAmount = function(){
            return(amount)
        },

        getAmountSq = function(){
            return(amountsq)
        }
    ))

# Puchase constructor is a function that returns a ref object
Purchase <- function(ID, amount, timestamp){
    newPurchase <- Purchase_$new(purchaser = ID, amount = amount, 
    amountsq = amount**2, timestamp = timestamp)
    return(newPurchase)
}


# we're going to process a file line by line..
printLines_1 <- function(filepath) {
  con <- file(filepath, "r")
  on.exit(close(con))
  lines <- readLines(con)
  # now get length to prepare list.. 
  len <- length(lines)
  for(i in 1:len) {
    line <- lines[i]
    print(line)
  }
}

# why is this approach safer than the above?
printLines_2 <- function(filepath) {
  con <- file(filepath, "r")
  on.exit(close(con))
  while ( TRUE ) {
    line <- readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    print(line)
  }
}


# return a list of purchases 
jsonToPurchases <- function(filepath) {
  con <- file(filepath, "r")
  on.exit(close(con))
  lines <- readLines(con)
  # now get length to prepare list.. 
  len <- length(lines)
  purchases <- vector("list", len)
  for(i in 1:len) {
    line <- fromJSON(lines[i])
    amount <- as.numeric(line$amount)
    purchases[[i]] <- Purchase(line$id, amount, line$timestamp)
  }
  return(purchases)
}

purchases <- jsonToPurchases("sampleData.json")
# now that we have a nice list of object why don't we create a data frame and start plotting it?
# create three vectors: TODO
#   ids - leave as string
#   amounts - already been converted to numeric
#   timestamps - turn this to number of days from "2017-01-01"

startDate <- as.Date("2017-01-01")
# for more accuracy could also use as.POSIXlt
# see http://www.statmethods.net/input/dates.html
# see https://www.stat.berkeley.edu/~s133/dates.html

# http://www.r-tutor.com/r-introduction/data-frame
ids <- sapply(purchases, function(x) x$purchaser) # Done for you!
amounts <- c() # TODO
times <- c() # TODO

df <- data.frame(ids, amounts, times)


# scatter plot creation http://ggplot2.tidyverse.org/reference/geom_point.html
scatterplot_1 <- function(){
    p <- ggplot(df, aes(times, amounts) )
    p + geom_point()
    return(p) # not that important but if we want to multiplot.. 
}

# axis label editting http://ggplot2.tidyverse.org/reference/labs.html
scatterplot_2 <- function(){
    p <- ggplot(df, aes(times, amounts, colour = ids) ) + geom_point() # fux with colors
    # we would never make a plot without proper axis labels AND units!!!!!
    p <- p + labs(colour = "Purchaser ID", 
    x = "Days from January 1, 2017", 
    y = "Amount (U.S. Dollars)" )
    return(p)
}

scatterplot_3 <- function(){
    p <- ggplot(df, aes(times, amounts, shape = ids) ) + geom_point() # fux with shapes
    p + scale_shape(solid = FALSE)
    p + labs(shape = "Purchaser ID", 
    x = "Days from January 1, 2017", 
    y = "Amount (U.S. Dollars)" )
    return(p)
}

scatterplot_4 <- function(){
    # combine the first two scatter plots into a really cool one!
    # see the scatter plot creation link above
}


