This weeks homework is fairly light on coding. We are getting into ggplot2. Here is the function reference sheet: http://ggplot2.tidyverse.org/reference/

1. ggplot's take in a data frame as their source for plotting data. Look at how data frames are created: http://www.r-tutor.com/r-introduction/data-frame. Given a list of purchase objects, how can we create 3 vectors of purchaser id's, amounts and days from Jan 1, 2017? Hint: for purchaserID's I might use _sapply(purchases, function(x) x$purchaser)_ to tease out all the purchaserID's. Another hint: When calculating days from Jan 1 it is appropriate to use subtraction on two dates e.g. someDate - startDate where startDate <- as.Date("2017-01-01"). These vectors can be found on lines 86-88. 

2. In Session 10 jsonToPurchases.R in the the labeling wasn't working because I added a line of code and forgot to test it out (yikes!). I made a change to one of the scatterplot functions and now it works properly.. _Find the bug!_ For reference this is where I learned labels however you shouldn't need this to diagnose the bug. http://ggplot2.tidyverse.org/reference/labs.html

3. Finish the 4th scatterplot function to make a pretty plot with shapes AND colors (and there better be labels on it too). See http://ggplot2.tidyverse.org/reference/geom_point.html

4. Think of at least one other way we can visualize the purchase data and decide which plot would be best for that. See http://ggplot2.tidyverse.org/reference/

5. Read this article https://en.wikipedia.org/wiki/Tree_traversal. Be able to explain BFS vs DFS. Look at the *Implementations* section and understand iterative vs recursive traversal strategy. 