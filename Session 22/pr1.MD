I orginally wrote this in the R file where you are writing grow but it was taking 
up so much space, I didn't want you to be intimidated by all the text so I moved
it to it's own MD file. 

# ==================================================== #
# ============== ORDER PERMUTATIONS ================== #
# ==================================================== #


# the order-permutation is a well studied problem and you probably went over it in high school
# "how many different ways can we arrange these books" blah blah blah

# the simple answer is usually N! where N is the number of elements 

# in this exercise we are going to reorder a vector in the N! ways it can be reordered!
# how are we going to do this?

# remember if our vector is myVec <- c('a', 'b', 'c')
# then myVec[1:3] will return c('a', 'b', 'c')
# myVec[c(1,3,2)] will return c('a', 'c', 'b')
# myVec[3:1] returns c('c', 'b', 'a')
# myVec[c(3,1,2)] returns c('c', 'a', 'c')
# myVec[c(2,1,3)] returns c('b', 'a', 'c')
# and myVec[c(2,3,1)] returns c('b', 'c', 'a')

# length(myVec) == 3
# 3! == 6 and hence we have the 6 orderings of myVec. 

# don't worry about programming for cases like myVec <- c('a', 'a', 'b')
# we don't need to lose our minds (yet). We can assume all elements are 'distinct'

# TODO: SIDE QUESTION: how many distinct orderings does c('a', 'a', 'b') have?
3
# what about a vector items the Counter is {'a': 4, 'b': 4, 'c':2} 
?
# we're not going to program this but this is a nice warm up 
# because we are going to delve into combinatorics 


# see growHint.R for super literal, line-by-line, demonstrations 
# of what will be occuring in your grow function