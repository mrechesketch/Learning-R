
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
    if(n==0){
        return(c())
    }
    return(c(rangeRecursive(n-1),n))
}




# ================================= #
# these functions will compute the base^power
# ================================= #

# you will notice all of these functions are broken.. that's 
# becase i want you to fix them!

# TODO use the native R syntax, if you forget... Google it!
nativePower <- function(base, power){
    return(base**power)

}

# TODO use a for loop to compute power
forLoopPower <- function(base, power){
    returnValue <- 1
    for(i in 1:power){
        returnValue <- returnValue * base
    }
    return(returnValue)
}

# TODO use a while loop, I have graciously provided your stopping condition ;)
whileLoopPower <- function(base, power){
    returnValue <- 1
    while(!power==0){
        returnValue <- returnValue * base
        power <-power-1
    }
        # returnvalue <- base**(base, power-1)
    return(returnValue)
}

recursivePower <- function(base, power){
   while(!power==0){
       return(1)
   }
   return(n * recursivePower(power-1))
}


# ================================= #
# we're going to have some fun with strings now
# ================================= #



# this function takes in a string 
    # two letters followed by seven numbers
    # the sum of the 1,3,5 + 2*sum of 2,4,6
    # should equal a number whose last digit is the 7th

# example: BJ6125341 -> (6+2+3) + 2*(1+5+4) = 31
        # the last digit of 31 is 1 which is the 7th number
        # return true 
checkDEANumHardCode <- function(stringCode){
    # first split the code into a vector of characters
    chars <- strsplit(stringCode, "")
    odds <- as.integer(chars[[1]][3]) + as.integer(chars[[1]][5]) + as.integer(chars[[1]][7])
    evens <- as.integer(chars[[1]][4]) + as.integer(chars[[1]][6]) + as.integer(chars[[1]][8])
    summation <- odds + 2*evens
    return(summation%%10==as.integer(chars[[1]][9]))
}

# that approach took only 5 lines of code but 3 of those lines are awful to look at
    # lets try this again with a slicker approach

checkDEACode <- function(stringCode){
    charnums <- strsplit(substr(stringCode,3,9), "")
    nums <- unlist(lapply(charnums, function(x) as.integer(x)))
    summation <- 0
    for(i in 1:(length(nums)-1)){
    #     if (i %% 2 == 0){
    #         summation <- summation + (nums[i]*2)
    # }
    # else{
    #     summation <- summation + (nums[i])
    # }
    summation <- summation + if(i%%2) 2*nums[i] else nums[i]
    }
    return(summation%%10 == nums[7]) #TODO FINISH THIS WITH A FOR LOOP!
}

deaCodeTest1 <- identical(checkDEACode("BJ6125341"), checkDEANumHardCode("BJ6125341"))
deaCodeTest11 <- identical(checkDEACode("BJ6125341"), TRUE)
deaCodeTest12 <- identical(TRUE, checkDEANumHardCode("BJ6125341"))
deaCodeTest2 <- identical(checkDEACode("FN5623740"), checkDEANumHardCode("FN5623740"))
deaCodeTest21 <- identical(checkDEACode("FN5623740"), TRUE)
deaCodeTest22 <- identical(TRUE, checkDEANumHardCode("FN5623740"))
deaCodeTest3 <- identical(checkDEACode("AR3221377"), checkDEANumHardCode("AR3221377"))
deaCodeTest31 <- identical(checkDEACode("AR3221377"), FALSE)
deaCodeTest32 <- identical(FALSE, checkDEANumHardCode("AR3221377"))


# tHiS funCtiOn ShOUld RAndOmLY cHaNGE CaSIng
spongeBobMemer <- function(phrase){
    charmeme<- unlist(strsplit(phrase,""))
    charVec <- sapply(charmeme, function(x) alwaysblue(x))
    # useful functions tolower(char) and toupper(char)
    # useful page: https://stackoverflow.com/questions/7201341/how-can-2-strings-be-concatenated
        # consider splitting characters as above.. apply some function with sapply.. then collapse
    return(paste(charVec, collapse = ""))

} 


alwaysblue <- function(char){
    chance <- runif(1, 0, 1)
    return(if(chance>=0.5) tolower(char) else toupper(char))
}



