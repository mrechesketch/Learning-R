
# base case: we have 1 element so we have one ordering: myVec[1]

# when we have two elements there are two spots we could put the 2: before or after the 1
# the orderings are: c(1,2) and c(2,1)

# when we have 3 elements, there are 3 spots we could put the 3 for either of the orderings for 2 elements
# hence we have 6 possible orderings
    # start: c(1, 2) 
        # put it at the front: c(3, 1, 2)
        # in the middle: c(1, 3, 2) 
        # on the end: c(1, 2, 3)
    # start: c(2, 1)
        # front: c(3, 2, 1)
        # middle: c(2, 3, 1)
        # end: c(2, 1, 3)

# and so on...

# vectorization with R makes this process WAY easier than using nested for loops 
# thank your lucky stars

# example 1, insert 2 into the c(1)
one <- 1 # our base case ordering possibilities 

two <- 1:2 # helper vector

# allocate space for answers
ans_1 <- numeric(2)
ans_2 <- numeric(2)

# now we insert using vectorization to our advantage!
ans_1[ two[1] ] <- 2 # two[1] is 1 and we want to put 2 into the first spot of ans_1
ans_1[ two[-1] ] <- one # fill in the rest with our base case 

ans_2[ two[2] ] <- 2 # two[2] is 2 and we want to put 2 into the last spot of ans_2
ans_2[ two[-2] ] <- one # exclude the 2 and fill in the rest with 1

# this example is actually kinda confusing given that what we are trying to do is elementary
# hopefully the next more complicated example will make sense


# example 2, lets insert 3 into the orderings of 2

    # the two orderings of two
ans_1 <- c(2,1)
ans_2 <- c(1,2)

    # we're moving to the 3 vector.. this variable will help
three <- 1:3

    # possible results (allocating space)
result_1_1 <- numeric(3) # should result in c(3, 1, 2)
result_1_2 <- numeric(3) # should result in c(1, 3, 2)
result_1_3 <- numeric(3) # should result in c(1, 2, 3)

result_2_1 <- numeric(3) # should result in c(3, 2, 1)
result_2_2 <- numeric(3) # should result in c(2, 3, 1)
result_2_3 <- numeric(3) # should result in c(2, 1, 3)


result_1_1[ three[1] ] <- 3 # we're inserting 3 into the front hence the 1
result_1_1[ three[-1] ] <- ans_1 # the two gets the rest of the results 
    # notice how we included the 1 when we inserted the new number, 3
    # and excluded the 1 when we inserted the old vector 

result_1_2[ three[2] ] <- 3 # insert the 3 into the middle 
result_1_2[ three[-2] ] <- ans_1 # two gets everything but the middle

result_1_3[ three[3] ] <- 3 # same process as the above two
result_1_3[ three[-3] ] <- ans_1

# i'm going to leave out the rest because it's sorta redundant at this point