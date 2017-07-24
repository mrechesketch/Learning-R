# courtesy of https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r#gs.PeS3dwU
rm(list = ls()) # handy command for clearing workspace


readinteger <- function(){
  readline(prompt="Please, enter your ANSWER: ")
}

repeatEx <- function(someNumber){
    repeat {   
    response <- as.integer(readinteger());
    if (response == someNumber) {
        print("Well done!");
        break
    } else cat("Sorry, the answer to whatever the question MUST be ", someNumber, "\n");
    }
}


# lets see what a while loop looks like
whileEx <- function(n){
    nums <- c(1:10)
    i <- 1
    while(!is.na(nums[i])){
        print(nums[i])
        i <- i + n
    }
}

# lets return to our previously defined matrices
source("Session 2/introductionToLoops.R") # this is pretty cool by the way ;)

# FUNCTIONAL PROGRAMMING!!!

mystery1 <- apply(ourMatrix, 1, sum)
mystery2 <- apply(anotherMatrix, 2, function(x) x**2)
testMystery <- identical(mystery1, mystery2) # what is going on here???

