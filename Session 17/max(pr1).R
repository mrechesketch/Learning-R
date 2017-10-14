#R version 3.3.2 
  


# part I: write your own max function
# obviously don't use max.. 

# with recursion:

maxRec <- function(NumVec){
    if (length(NumVec) == 1){
        return (NumVec[1])
        }
    
    if (NumVec[1] > NumVec[2]){
        NumVec[2] <- NumVec[1]
        }
    return( maxRec(NumVec[-1]))
}
    
#numVec[1] <- maxRec(numVec[-1])


# now do it with a for loop (example done)

maxFor <- function(NumVec){
    currentMax <- NumVec[1] # currentMax is the first element 
    for ( i in seq_along(NumVec) ){
        if ( currentMax < NumVec[i] ) currentMax <- NumVec[i] # if you see a better one, overwrite
    }
    return( currentMax ) # return the current max
}

# and while loop (you might want to refresh yourself on while loops)
# see https://www.programiz.com/r-programming/while-loop
# hint: use while( !is.na(NumVec[i] ) ) because when you get to i = length + 1
# that means A) you have made it through th entire vector and B) NumVec[i] will return an NA

maxWhile <- function(NumVec){
    currentMax <- NumVec[1] # currentMax is the first element 
    i <- 1
    while(!is.na(NumVec[i])){ 
        if ( currentMax < NumVec[i] ) currentMax <- NumVec[i] # if you see a better one, overwrite
        i <- i+1
    }          
    return( currentMax ) # place holder
}


# and lastly with Reduce (can be done in one line with the ternary operator / anonymous function) NO MAX!
# refresher on ternary operator https://stackoverflow.com/questions/8790143/does-the-ternary-operator-exist-in-r

maxRed <- function(NumVec) Reduce(function(x,y) if (x>y) x else y, NumVec) 


passFail <- function(x, y) if (x == y) "PASS" else "FAIL"
customVec <- c(3, 55, 4, 77, 32)

cat("\n")
print("maxRec Tests")
t1 <- maxRec(1)
t2 <- maxRec(1:10)
t3 <- maxRec( customVec )
cat("the output of maxRec(1) is:", t1, passFail(t1, 1), "\n" )
cat("the output of maxRec(1:10) is:", t2, passFail(t2, 10), "\n" )
cat("the output of maxRec( c(3, 55, 4, 77, 32) ) is:", t3, passFail(t3, 77), "\n" )

print("maxFor Tests")
t1 <- maxFor(1)
t2 <- maxFor(1:10)
t3 <- maxFor( customVec )
cat("the output of maxFor(1) is:", t1, passFail(t1, 1), "\n" )
cat("the output of maxFor(1:10) is:", t2, passFail(t2, 10), "\n" )
cat("the output of maxFor( c(3, 55, 4, 77, 32) ) is:", t3, passFail(t3, 77), "\n" )

print("maxWhile Tests")
t1 <- maxWhile(1)
t2 <- maxWhile(1:10)
t3 <- maxWhile( customVec )
cat("the output of maxWhile(1) is:", t1, passFail(t1, 1), "\n" )
cat("the output of maxWhile(1:10) is:", t2, passFail(t2, 10), "\n" )
cat("the output of maxWhile( c(3, 55, 4, 77, 32) ) is:", t3, passFail(t3, 77), "\n" )

print("maxRed Tests")
t1 <- maxRed(1)
t2 <- maxRed(1:10)
t3 <- maxRed( customVec )
cat("the output of maxRed(1) is:", t1, passFail(t1, 1), "\n" )
cat("the output of maxRed(1:10) is:", t2, passFail(t2, 10), "\n" )
cat("the output of maxRed( c(3, 55, 4, 77, 32) ) is:", t3, passFail(t3, 77), "\n" )