

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
    return(stdLoop(numVec)) #we could change to stdApply to test that 
}

meanTest0 <- identical( mean( c(1,1,1,1)), 1)
meanTest1 <- identical( mean( c(1,2,10)), 4.333333)
meanTest2 <- identical( mean( c(1,2,10,99,33,10)), 25.83333)
meanTest3 <- identical( mean( c(19, 25, 29, 30, 22)), 25 )

stdTest1 <- identical( std( c(1,2,10)), 4.027682)
stdTest2 <- identical( std( c(1,2,10,99,33,10)), 34.3774)
stdTest3 <- identical( std( c(19, 25, 29, 30, 22)), 4.147288 )


start <- function(){
    myArray <- c()
    len <- 0
    printHelpMenu()
    repeat{
        input <- readline(prompt="input: ")
        if (input == "h"){
            printHelpMenu()
        }
        else if (input == "a"){
            print(myArray)
        }
        else if (input == "l"){
            print(len)
        }
        else if (input == "s"){
            print("sum")
        }
        else if (input == "m"){
            print(mean(myArray))
        }
        else if (input == "q"){
            print(myArray)
            break
        }
        else if (!is.na(as.numeric(input))){
            myArray[len+1] <- as.numeric(input)
        }
    }
}

printHelpMenu <- function(){
    print("h: print this menu")
    print("*numeric*: add that number to your array")
    print("a: print the contents of your array")
    print("l: see the length of the array")
    print("s: see the sum of the array")
    print("m: see the average of the array")
    print("q: quit this program")
    cat("anything else will cause a warning \n")
}