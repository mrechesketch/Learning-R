

# dynamic programming approach for calculating factorial of a number
factorial <- function(N){
    stopifnot(N >= 0) # stop if N is less than 0

    facTable <- numeric(N+1) # allocate an array of size N+1
   
    facTable[1] <- 1 # 0! = 1 
    # facTable[2] <- 1 # 1! = 1
   
   # fill in the rest of the table
    for(i in 1:(N+1)){
        facTable[i+1] <- i * facTable[i] 
    }

    return(facTable[N+1])
}

# returns the triangle number summation of N
summation <- function(N){
    stopifnot(N >= 0) # stop if N < 0

    nthNumber <- numeric(N+1)

    nthNumber[1] <-0
  
    
    # create a table
    for(i in 1:(N+1)){
        nthNumber[i+1] <- i + nthNumber[i] 
    }

    return(nthNumber[N+1])
    
}

stopifnot(summation(1)==1)
stopifnot(summation(5)==15)
# problems courtesy of https://www.codechef.com/wiki/tutorial-dynamic-programming

# ============================================================================== #
# ============================Fibonacci Calculator============================== #

# computes the Nth fibonacci number recursively 
fibR <- function(N){
    if( (N == 1) || (N == 0) ){
        return(1)
    }
    return( fibR(N-1) + fibR(N-2) )
}


# TODO: DP solution!

fibDP <- function(N){

    fibTab <- numeric(N+1)

    fibTab[1] <- 1
    fibTab[2] <- 1

    if(N<=1){
        return(fibTab[N+1])
    }

    for(i in 2:(N+1)){
        fibTab[i+1] <- fibTab[i]+fibTab[i-1]
    }
    return(fibTab[N+1])
}


fib <- function(N){
    return(fibDP(N)) # switch this to fibDP when you want to test!
}

# fib tests 
stopifnot( fib(0) == 1 )
stopifnot( fib(1) == 1 )
stopifnot( fib(2) == 2 )
stopifnot( fib(3) == 3 )
stopifnot( fib(4) == 5 )






# ============================================================================== #
# ============================Steps to One Problem============================== #

# steps to one problem: 
    # minimize the number of steps it takes to for N to 1 with the function
    # with options: subtract 1, divide by 2 (if you can), divide by 3 (if you can)
    # repeat!

stepsToOneR <- function(N){
    stopifnot( N>= 0) # stop if N < 0

    if(N == 1){
        return(0) # base case, N is 1.. 0 steps
    }

    div2 <- N %% 2 == 0
    div3 <- N %% 3 == 0

    minusOneCall <- stepsToOneR(N-1)
    
    # only check the minus 1
    if( !(div2 || div3) ){
        return( 1 + minusOneCall ) # can only subtract 1 bc no divisibility
    }

    # we have to check all 3 
    if(div2 && div3){
        return( 1 + min( minusOneCall, stepsToOneR(N/2), stepsToOneR(N/3) ) )
    }

    # only /2 and minus 1
    if(div2){
        return( 1 + min( minusOneCall, stepsToOneR(N/2) ) )
    }

    # only /3 and minus 1 
    if(div3){
        return( 1 + min( minusOneCall, stepsToOneR(N/3) ) )
    }
}

# TODO steps to one DP!! 
stepsToOneDP <- function(N){
    stopifnot( N>= 0)
    #allocate space for an array
    stepsTable <- numeric(N+1)
    #fill in base case
    stepsTable[1] <- 0
    if(N==1){
        return(0)
    }
    
    for( i in 2:N){ 
        #minus 1 call
        stepsTable[i] <- 1 + stepsTable[i-1] 
        #div 2 call
        if(i %% 2 == 0){
            stepsTable[i] <-  min( stepsTable[i], 1 + stepsTable[i/2])
        }
        #div 3 call
        if (i %% 3 == 0){
            stepsTable[i] <-  min( stepsTable[i], 1 + stepsTable[i/3])
        }

    }

    return(stepsTable[N])
}

stepsToOne <- function(N){
    return(stepsToOneDP(N))
}

stopifnot( stepsToOne(1) == 0 )
stopifnot( stepsToOne(2) == 1 )
stopifnot( stepsToOne(3) == 1 )
stopifnot( stepsToOne(4) == 2 )
stopifnot( stepsToOne(5) == 3 )
stopifnot( stepsToOne(90) == 5 )
stopifnot( stepsToOne(99) == 6 )
stopifnot( stepsToOne(130) == 8 )




# ============================================================================== #
# ============================The Knapsack Problem============================== #

# given an arrays of weights and values AND an int size of knapsack 
    # ex: w <- [5, 3, 5, 9]
    # v <- [3, 44, 3, 69]
    # size <- 10
        # output << 69
    # items is the len of weights or values

# this problem is pretty similar to the recursive change problem we did!

knapsackR <- function(size, weights, values, items){
    # base case, we have no more weights or values.. return 0
    if(items == 0){
        return(0)
    }
    #lose it first, see if otherwise
    loseIt = knapsackR(size, weights[-1], values[-1], items-1)
    if(size-weights[1]<0){
        return(loseIt)
    }
    # useIt calls!
    useIt = values[1] + knapsackR(size-weights[1],weights[-1], values[-1], items-1)
    
    # return the max of useIt and loseIt (what is the data type of the function call??)
    return(max(useIt, loseIt))
}

# TODO, lets do this sucker! 
#TWO DIMENSION MOFO
# taken from http://www.geeksforgeeks.org/dynamic-programming-set-10-0-1-knapsack-problem/
knapsackDP <- function(size, weights, values, items){
    return(0)
}

knapsack <- function(size, weights, values, items){
    return(knapsackR(size, weights, values, items))
}

stopifnot( knapsack(10, c(), c(), 0) == 0)
stopifnot( knapsack(10, c(5, 3, 5, 9), c(3, 44, 3, 69), 4) == 69)

#change <- function(amount, change)




