
# ================================= #
# these functions will create a vector 
# with elements 1 through N space 1 apart 
# ================================= #


    # uses the native syntax
rangeNative <- function(n){
    return(c(1:n))
}

    # pre allocate the array
rangePreAllocate <- function(n){
    ourArray <- numeric(n)
    for(i in 1:n){
        ourArray[i] <- i
    }
    return(ourArray)
}

    # does not pre allocate the array
rangeNoAllocate <- function(n){
    ourArray <- numeric(0)
    for(i in 1:n){
        ourArray[i] <- i
    }
    return(ourArray)
}

    # uses append syntax
rangeAppend <- function(n){
    ourArray <- c()
    for(i in 1:n){
        ourArray <- c(ourArray, n)
    }
    return(ourArray)
}

    # TODO WRITE A RECURSIVE FUNCTION THAT DOES THE SAME STUFF AS ABOVE
rangeRecursive <- function(n){
    # base case for functions that return vectors usually return an empty vector 
    # your recursive call should look like c(rangeRecursive(somethinghere), something else here..)
    return(c()) # this is just a place holder, change me!
}




# ================================= #
# these functions will compute the base^power
# ================================= #

# you will notice all of these functions are broken.. that's 
# becase i want you to fix them!

# TODO use the native R syntax, if you forget... Google it!
nativePower <- function(base, power){
    return(0)
}

# TODO use a for loop to compute power
forLoopPower <- function(base, power){
    returnValue <- 1
    for(i in 1:power){
        returnValue <- 0 #0 is a place holder... change it!
    }
    return(returnValue)
}

# TODO use a while loop, I have graciously provided your stopping condition ;)
whileLoopPower <- function(base, power){
    while(!power==0){
        # do something in here.. maybe we need an additional variable
        # like we use in the above function
        # but something definitely needs to happen to power in here
    }
    return(0)
}

recursivePower <- function(base, power){
    # our base case is similar to what the condition 
    # of the above functions while loop!
    # this function is remarkably similar to triangleNumber lol
    return(0)
}

