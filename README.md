# Session 1: Recursion

## Writing Tests
i love tests!

## Triangle Numbers and Factorial

## The Knapsack Problem: Use it or Lose it! 

To remind of of this problem, our change function returns a boolean and takes two paramters __amount__ and __coins__. __amount__ is some numeric value and __coins__ is a vector or numerics. If we can make __amount__ using some combination of our the elements in __coins__ then we return true, otherwise return false. 

Lets think about the base case? When should this function stop? When the __coins__ is empty or... Hmm. Lets hold that thought and think about our recursive call(s). This problem is called *use it* or *lost it* because we are going to make TWO recursive calls and return their logical OR (wow). 

HINT: when we *use it* we subtract the first element of __coins__ from __amount__; when we *lose it*, we don't!  


    useIt = change(~, ~)
    lostIt = change(~. ~)
    return useIt || loseIt

Here are some tasty tests for you:

    changeTest1 = identical(change(38, c(1, 12, 15, 42, 25)), TRUE)
    changeTest2 = identical(change(37, c(1, 12, 15, 42, 25)), TRUE)
    changeTest3 = identical(change(0, c()), TRUE)
    changeTest4 = identical(change(1, c()), FALSE)
    changeTest5 = identical(change(36, c(1, 2, 3, 25)), FALSE)


# Session 2: Loops!

## Introduction to Big O Runtime 

# Session 3: Dynamic Programming

# Session 4: Object Oriented Programming

# Session 5: Data Structures

# Session 6: Algorithms

# Session 7: Packages

# Session 8: Plotting Curves