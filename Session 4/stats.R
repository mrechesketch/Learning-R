

# ========================== HOMEWORK ================= #

# the parameter numVec is a vector of numerics
    # calculate the mean of this vector
    # HINT: consdier commands like sum and length

mean <- function(numVec){
    return(sum(numVec)/length(numVec))
}

# the parameter numVec is a vector of numerics
    # calculate the standard deviation of this vector
    # using two different approaches

    # use sapply(numVec, function(x) (WHAT GOES HERE)**? )
stdApply <- function(numVec){
    avg <- mean(numVec)
    quadraticVec <- sapply(numVec, function(x) (x-avg)**2)
    return( ( (sum(quadraticVec))/length(numVec))**0.5)
}

stdLoop <- function(numVec){
    avg <- mean(numVec)
    n <- length(numVec)
    quadraticSum <- 0
    for(i in 1:n){
        quadraticTerm <- (numVec[i]-avg)**2
        quadraticSum <- quadraticSum + quadraticTerm 
    }
    return((quadraticSum/n)**0.5)
}



# this function is for testing.. don't worry about it
std <- function(numVec){
    return(stdApply(numVec)) #we could change to stdApply to test that 
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
    sum <-0
    sqrsum <- 0

    
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
          mean <- sum/len
          print((sqrsum/len-mean**2)**.5)
        }
        else if (input == "m"){
            print(sum/len)
        }
        else if (input == "q"){
            break
        }
        else if (!is.na(as.numeric(input))){
            num <- as.numeric(input)
            myArray[len+1] <-num
            len <- len+1
            sum <- sum+ num
            sqrsum <- sqrsum+ num**2
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