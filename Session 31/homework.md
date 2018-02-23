## HOMEWORK

1. Please read [this page](https://cran.r-project.org/web/packages/R6/vignettes/Performance.html) which compares performance of ref classes, r6 and environments

2. Create a calculate function which takes in a person and returns their running percentile donation . Refer to the [wiki page](https://en.wikipedia.org/wiki/Percentile) on what answer you should be getting. I already did the easy part of calculating the ceiling of perc * number. I created a person list for you to test with. Our updatePerson function is fucked up right now :(. We can trouble shoot it tomorrow or I'll fix it before we meet. Feel free to look at it and play around with it yourself. **update 02/21 12:30** I fixed our updatePerson method so now it inserts items in the correct order. Our approach was a bit flawed, we can talk about it tonight.  

3. I have been thinking about our approach for holding all entries in a single environment. I am beginning to have second thoughts.. The environment is going to be held in memory indefinitely which could be a problem if we load more entries in than we have RAM. One possible solution is to save check point files which hopefully are routed to the disk. We will pay a speed price for reading and writing these files however our size strategy is much much more reasonable. Look at save.R and think about how we can leverage these operations to complete the donations challenge. 

4. Look briefly at this [wiki page](https://en.wikipedia.org/wiki/Trie) and think about how we could leverage this prefix-tree structure in our record keeping.