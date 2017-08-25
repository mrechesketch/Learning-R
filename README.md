# Data Types

## Vectors

Declaring vectors is pretty simple.

    c(1:100) # a vector of numbers 1 to 100
    c(1, 1, 2, 3, 5, 8) # constructing on a sequence of numbers
    
    numeric(10) # a vector of 10 0's (0 is the default numeric)
    vector("numeric", 10) # this is the same as the above line
    logical(3) # a vector of 3 FALSE's (default boolean)
    character(6) # a vector of 6 "" (default character)
    ################## TAKE NOTE ##############################
    vector("list", 5) # flexibile, works well with objects!
    
    c(1, "alex", TRUE) # will coerce all elements into characters

   
Vectorization makes operating on them a breeze

    letters <- c('a', 'b', 'c')
    toupper(letters) # now letters == c('A', 'B', 'C')
    
    numbers <- c(1, 1, 2, 3, 5, 8)
    numbers <- numbers/sum(numbers) # normalize the vector numbers 

R offers some other built in functions for vectors. Here are some we've looked at:

    x <- c(1:100)
    y <- c(50:150)
    
    diff(x) # equivalent to x[-1] - x[-100]

    sapply(x, function(x) x**2) # equivalent to x**2

R also comes with set operations but becareful with these! Use only in simple cases =/

    union(x, y) # == c(1:150)
    intersext(x, y) # == c(50:100)

    setdiff(x, y) # == c(1:49)
    setdiff(y,x) # == c(101:150)

    setequal(x,y) # == FALSE

    is.element(150, x) # == FALSE
    is.element(150, y) # == TRUE



## Characters


# Recursion

## Make Change

To remind you of this problem, our change function returns a boolean and takes two paramters __amount__ and __coins__. __amount__ is some numeric value and __coins__ is a vector or numerics. If we can make __amount__ using some combination of our the elements in __coins__ then we return TRUE, otherwise return FALSE. 

Lets think about the base case? When should this function stop? When the __coins__ is empty or... Hmm. Lets hold that thought and think about our recursive call(s). This problem is called *use it* or *lost it* because we are going to make TWO recursive calls and return their logical OR (wow). 

HINT: when we *use it* we subtract the first element of __coins__ from __amount__; when we *lose it*, we don't!  


    useIt <- change(amount-coins[1], coins[-1])
    lostIt <- change(amount , coins[-1])
    return(useIt || loseIt)

Here are some tasty tests for you:

    changeTest1 <- identical(change(38, c(1, 12, 15, 42, 25)), TRUE)
    changeTest2 <- identical(change(37, c(1, 12, 15, 42, 25)), TRUE)
    changeTest3 <- identical(change(0, c()), TRUE)
    changeTest4 <- identical(change(1, c()), FALSE)
    changeTest5 <- identical(change(36, c(1, 2, 3, 25)), FALSE)


# Loops!

## Overview

Loops will make you wonder why you ever use recursion. Loops tend to make more sense to us because they are more similar to how we think. R features 3 different types of loops. The first two appear in many languages and are called *for* and *while*. The last one is called a *repeat*. The latter two continue until some condition is met (or violated) and *for* loops will run for a set number of times. Lets look at some examples:

    N <- 100

    for(i in 1:N){
        print(i)
    }

    i <- 1
    while(i <= N){
        print(i)
        i <- i+1
    }

    i <- 1
    repeat{
        print(i)
        i <- i+1
        if(i == N){
            break
        }
    }

These three examples all do the same (uninteresting) thing: print numbers 1 to 100. 

 

