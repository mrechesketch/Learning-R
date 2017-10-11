
# taken from chapter 6 : Functions

`%@%` <- function(vector, index) vector[index] # we're defining an infix function

stringVector <- strsplit("hello my name is silm shady", " ")[[1]]

# the infix function is used in between parameters like so

result <- stringVector %@% 3 # 3rd element should be "name"

stopifnot(result == "name") # if you can source this file... then this is true..

# TODO, define an infix operator %+% for two strings such that 
# string1 %+% string2 goes to string1string2 -- try out paste0(s1, s2).. similar to paste(s1, s2)

`%+%` <- function(string1, string2) paste0(string1, string2)
# you might have noticed I left the return(stuff) out of the first function
# I could have very easily written return(vector[index]) and it would work the same
# think anonymous function .. one line, minimal syntax
# your answer should not have a return statement... it should be inferred!



problem_1 <- function(){
    stopifnot( "hello" %+% "goodbye" == "hellogoodbye" )
    stopifnot( "hello" %+% " goodbye" == "hello goodbye" )
    print("problem 1 complete!")
}

`%_%` <- function(vector, number) Filter(function(x) x %% number == 0, vector)

     # TODO

# HINT: use a Filter( anonymous function, vector )

problem_2 <- function(){
    stopifnot( c(4:30) %_% 3 == c(6, 9, 12, 15, 18, 21, 24, 27, 30) )
    stopifnot( c(17:100) %_% 13 == c(26, 39, 52, 65, 78, 91) )
    print("problem 2 complete!")
}

`%?!%` <- function(something, somethingToDo) if ( !is.null(something) ) somethingToDo

`%??%` <- function(something, somethingToDo) if (is.null(something))  somethingToDo



# replacement!!!

startValue <- 7


# this function might not do anything
plusPlus <- function(value, increment){
    value <- value + increment # no return statement.. only assignment
}

plusPlus(startValue, 3) # does anything happen to start value?
stopifnot(startValue == 7) # hint.. nothing happens

# this is a replacement
`incr<-` <- function(value, increment) value + increment # return statement has been omitted

otherValue <- startValue
incr(startValue) <- 3 # this is how a replacment function gets used.. kinda weird
stopifnot(startValue == 10)
stopifnot(otherValue == 7) # hmm that's interesting

# this is an infix mixed up with a <<- assignment
`%+=%` <- function(value, increment) incr(value) <- increment # no return statement, only assignment

startValue %+=% 3
stopifnot(startValue == 10) # nothing happened here either :( 

# TODO: speculate why the replacement function is called replacement and not modification





