

# ========================== HOMEWORK ================= #

# the parameter numVec is a vector of numerics
    # calculate the mean of this vector
    # HINT: consdier commands like sum and length
mean <- function(numVec){
    return(0)
}

# the parameter numVec is a vector of numerics
    # calculate the standard deviation of this vector
    # using two different approaches

    # use sapply(numVec, function(x) (WHAT GOES HERE)**? )
stdApply <- function(numVec){
    avg <- mean(numVec)
    quadraticVec <- c() # place holder.. put your sapply call here instead of c()
    return(0)
}

stdLoop <- function(numVec){
    avg <- mean(numVec)
    quadraticSum <- 0
    # begin your loop now and use quadraticSum
    # as your intermediate variable
    return(0)
}

# this function is for testing.. don't worry about it
std <- function(numVec){
    return stdLoop(numVec) #we could change to stdApply to test that 
}

meanTest0 <- identical( mean(c(1,1,1,1)), 1)
meanTest1 <- identical( mean(1,2,10), 4.333333)
meanTest2 <- identical( mean(1,2,10,99,33,10), 25.83333)
meanTest3 <- identical( mean( c(19, 25, 29, 30, 22)), 25 )

stdTest1 <- identical( std(1,2,10), 4.027682)
stdTest2 <- identical( std(1,2,10,99,33,10), 34.3774)
stdTest3 <- identical( std( c(19, 25, 29, 30, 22)), 4.147288 )


start <- function(){
    myArray <- numeric(500)
    repeat{
        break
    }
}