source("Session 3/variousFunctions.R")

#returns the time it takes a single parameter function to complete
timeFunc <- function(func, parameter){
    # taken from https://stackoverflow.com/questions/6262203/measuring-function-execution-time-in-r
    startTime <- Sys.time()
    func(parameter)
    endTime <- Sys.time()
    timeTaken <- endTime - startTime
    return(as.numeric(timeTaken))
}

#creates a vector of times based on logarithmic parameters 0-10 
makeTimes <- function(func, numberOfElements){
    END <- 2**3
    stepSize <- END / numberOfElements
    exponents <- seq(0, END, by = stepSize)
    BASE <- 6
    params <- lapply(exponents, function(pow) BASE**pow)
    times <- lapply(params, function(param) timeFunc(func, param))
    return(unlist(times))
}

