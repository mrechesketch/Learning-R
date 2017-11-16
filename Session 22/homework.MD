We're doing combinatorics for this assignment so brush up using whatever resources necessary 

1. Read pr1.MD. Finish the grow() function in permuteOrder.R. The specifications for grow are listed above the function. If you want motivation for the function see pr1.MD and if you need a belabored example see growHint.R (but only look at the file after you have read pr1.MD!!)
2. How many distinct orderings does c('a', 'b', 'a') have? What about a vector whose counter is {'a': 4, 'b': 4, 'c': 1}?
3. In permuteSize.R finish the %C% (aka choose) function. n choose k is equal to n!/k!(n-k!) https://en.wikipedia.org/wiki/Combination. Dynamic programming solution will get more *snaps* (see Session 6/dymanicProgramming.R)
4. Read pr2.MD. How does the choose function relate to permuting size? Think deeply about this problem and be ready to talk about possible appraoches (I'm not sure I have one yet)
5. We're going to do more visualizations on Ticketleap_2017_Export.csv so have some #goals for us. We're going to make a multiplot (see http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/ for a nice example) and let's practice with a variety of plots (bar, scatter, line, map?). Anyway, have an idea for 4 plots. This means axes and any filters we need to further apply to the data.

count of postal code (zipcode map) 
date v proceeds, date on the x-axis,total proceeds on the Y
postal code v proceeds, zips on the x proceeds on the y, filter out low proceeds zips
event v proceeds, event on the x proceeds on the y, filter out low proceeds events