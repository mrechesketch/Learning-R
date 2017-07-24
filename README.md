# Session 1: Recursion

## Writing Tests
i love tests!

## Triangle Numbers and Factorial

## The Knapsack Problem: Use it or Lose it! 

To remind you of this problem, our change function returns a boolean and takes two paramters __amount__ and __coins__. __amount__ is some numeric value and __coins__ is a vector or numerics. If we can make __amount__ using some combination of our the elements in __coins__ then we return TRUE, otherwise return FALSE. 

Lets think about the base case? When should this function stop? When the __coins__ is empty or... Hmm. Lets hold that thought and think about our recursive call(s). This problem is called *use it* or *lost it* because we are going to make TWO recursive calls and return their logical OR (wow). 

HINT: when we *use it* we subtract the first element of __coins__ from __amount__; when we *lose it*, we don't!  


    useIt = change(you need to figure this, out)
    lostIt = change(not gonna give you all the , answers)
    return(useIt || loseIt)

Here are some tasty tests for you:

    changeTest1 = identical(change(38, c(1, 12, 15, 42, 25)), TRUE)
    changeTest2 = identical(change(37, c(1, 12, 15, 42, 25)), TRUE)
    changeTest3 = identical(change(0, c()), TRUE)
    changeTest4 = identical(change(1, c()), FALSE)
    changeTest5 = identical(change(36, c(1, 2, 3, 25)), FALSE)


# Session 2: Loops!

## Overview

Loops will make you wonder why you ever use recursion. Loops tend to make more sense to us because they are more similar to how we think. R features 3 different types of loops. The first two appear in many languages and are called *for* and *while*. The last one is called a *repeat*. The latter two continue until some condition is met (or violated) and *for* loops will run for a set number of times. Lets look at some examples:

 

## Introduction to Big O Runtime 

# Session 3: Dynamic Programming

# Session 4: Object Oriented Programming

# Session 5: Data Structures

# Session 6: Algorithms

# Session 7: Packages

# Session 8: Plotting Curves