1. Look at the *$has* method in enviroHash.R. To ask if an environement has an element of not, we would use *get* to search the environment and if it returned an error, then the object did not exist. We used *tryCatch* to settle this error into the boolean FALSE. Look over this page of documentation and see if there is an _existing_ analogous function we could leverage instead of using *get* / *tryCatch*. 
2. Bring in a sample from your workplace on something you have either previously worked on or are currently working on. Ideally the format is .csv but it could really be anything (txt file, web page, etc..). We will use R to analyze to access, clean, transform and visualize this data. 
3. For all the functions on review.R please answer the following.
    [A] - function takes in a vector as a paramter
    [B] - function takes in a function as a paramter
    [C] - function returns a vector
    [D] - function returns a function
    [E] - function does not return anything
    [F] - not enough information on what the return value of the function is
    [G] - function results in an error

    for example: 

            hmm <- function(A, B, C) D <- A(B + C)

            creates a binding of D to A(B + C) in the function's environment. Here A is acting as a function and by the + operator we know B and C have vector-like properties (remember 3 and c(3) are the same to R). Hence the answers would be (A, B, E)  
