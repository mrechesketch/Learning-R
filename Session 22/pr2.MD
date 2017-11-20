Now we're going to permute size

what does this mean?

Take for example: myVec <- c('a', 'b')
    - 1 way we can express myVec with two elements: c('a', 'b')
    - 2 ways we can express myVec with one element: c('a'), c('b')
    trivial case: there is 1 way we can express myVec with 0 elements: 

Now consider: myVec <- c('a', 'b', 'c')
    - 1 way to express myVec with 3 elements: c('a', 'b', 'c')
    - 3 ways to express myVec with 2 elements: c('a', b'), c('a', 'c'), c('b', 'c')
    - 3 ways to express myVec with 1 elements: c('a'), c('b'), c('c')
    - 1 way to express myVec with 0 elements: 


How can we program this!!? Think vectorization. Think DP. Avoid recursion. 