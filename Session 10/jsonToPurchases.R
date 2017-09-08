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
amounts <- sapply(purchases, function(x) x$amount) # TODO
times <- sapply(purchases, function(x) as.Date(x$timestamp) - startDate) # TODO
timestr <- sapply(purchases, function(x) x$timestamp)

df <- data.frame(ids, amounts, times, timestr)


# scatter plot creation http://ggplot2.tidyverse.org/reference/geom_point.html
scatterplot_1 <- function(){
    p <- ggplot(df, aes(times, amounts) )
    p <- p + geom_point()
    return(p) # not that important but if we want to multiplot.. 
    #there's no label funciton here
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
    p <- p + labs(shape = "Purchaser ID", #mistake is here, should be a <-
    x = "Days from January 1, 2017", 
    y = "Amount (U.S. Dollars)" ) 
    return(p)
}

scatterplot_4 <- function(){
    p <- ggplot(df, aes(times, amounts, shape = ids) ) + geom_point()
    p + scale_shape(solid = FALSE)
    p <- p + labs(colour = "Amount (U.S. Dollars)",
        x = "Days from January 1, 2017", 
        y = "Amount (U.S. Dollars)" ) +  
        geom_point(aes(colour = factor(ids)), size = 4) +
        geom_point(colour = "grey90", size = 5)+
        geom_point(colour = "black", size = 10 ) +
        geom_point(colour = "pink", size = 5)
    return(p) 
    # combine the first two scatter plots into a really cool one!
    # see the scatter plot creation link above
}

# scatterplot_5 <- function(){
#     p <- ggplot(df, aes(times, amounts, colours = ids) ) + geom_point()
#     p + scale_shape(
#         =50 return (TRUE)
#         <50 return (FALSE))
#     p <- p + labs(+ geom_point(alpha = 1/10) 
#     p <- p + labs(caption = "(based on data from Alex)")
#     x = "Days from January 1, 2017", 
#     y = "Amount (U.S. Dollars)" )
#     return(p) 
# }    

barPlotski <- function(){
    p <- ggplot(df, aes(ids)) + geom_bar()
    p <- p + labs(
        x = "ID Number", 
        y = "Count" ) 
    return(p)
}

barSplotski <- function(){
    p <- ggplot(df, aes(ids)) + geom_bar()
    p <- p + labs(
        x = "ID Number", 
        y = "Total Money Spent" ) 
    p <- p + geom_bar(aes(weight = amounts))
    return(p)
}

ones <- Filter(function(x) x$purchaser == '1', purchases)
onesam <- sapply(ones, function(x)  x$amount)

barKlotski <- function(){
    barSplotski() + geom_bar(aes(fill = times))
}



barNew <- function(){
    p <- ggplot(df, aes(ids)) + geom_bar()
    p <- p + labs(
        x = "ID Number", 
        y = "Total Money Spent" ) 
    p <- p + geom_bar(aes(weight = amounts))
    p <- p + geom_bar(aes(fill = timestr))
    return(p)
}
