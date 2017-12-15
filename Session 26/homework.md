1. Consider the two functions: add1 <- function(A,B,C) sum(A,B,C) and add2 <- function(A,B,C) A+B+C. For the following examples, answer with the output of (1) add1(x,y,z) and (2) add2(x,y,z)? 

    i. x = 2, y = 4, z = 5
        (1) > ANSWER: 11
        (2) > ANSWER: 11

    ii. x = 1:2, y = c(4, 8), z = 1:0
        (1) > ANSWER:16
        (2) > ANSWER: 6, 10

    iii. x = 2, y = c(4, 8), z = 3:0
        (1) > ANSWER: 17
        (2) > ANSWER: 

2. Based on your answer, finish your implementation of the curve class. You will need to change the slot named "C" to something else. Here is a link where someone else had a similar problem: http://r.789695.n4.nabble.com/Why-cant-my-S4-class-have-a-slot-named-C-td4407464.html. 

3. Finish the matrixSkimmer function. Now returnList is declared as list( row = numeric(0), col = numeric(0) ). You will need two append calls instead of just 1. This will make returnList much cleaner and aesthetically pleasing. 

4. I have a named list defined as hmm1 <- list( myData = numeric(0), add = function(num) myData <- append(myData, num) ) and another one hmm2 <- list( myData = numeric(0), add = function(num) myData <<- append(myData, num) ). 

    i. After I run hmm1$add(0), what will hmm look like?
        > ANSWER: 
    
    ii. What will hmm2 look like after hmm2$add(9), hmm2$add(99)? Try this in the R console.
        > ANSWER: 
    
    iii. See what value (if any) is bound to myData and see if that agrees with what you expected.

5. Read over tarakc02's implementation of a functional programming stack: https://tarakc02.github.io/fun-stack/. (I was quite perplexed by it, don't worry). Find at least 3 (built-in) functions we haven't talked about before and learn what they do.    

6. Look at the readme's on Tarak Shah's github projects and admire them. Hopefully they will inspire you. https://github.com/tarakc02/
