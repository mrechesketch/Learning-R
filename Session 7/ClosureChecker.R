# We're going to build a "closure checker!"
# example: "hello (my name is Alex)" is a valid string!
# but "hey what's up (Taylor" is not!
# similarly "())(()" would also be invalid

# we can do other stuff too like an HTML checker 
# example: "<p> this is a paragraph </p>"
# or: "<h1> this is a header </h1>"

# this is where is starts to get more complicated...
# example: sample <- function(poop){
#                 oh_goodness <- character(9)
#                 if(poop){
#                   return(FALSE)    
#                  }
#                  return(0)
#            }

# there we see two types of closure: () and {} and they are nested! fuck..

# ( {) }

# so how are we going to do this? Lets use a stack!
    # a stack is like a linked list (Session 5)
    # it can push and pop and tell you if it's empty
# whenever we see an opener we'll push it onto the stack
# whenever we see a closer we'll pop it off!
# if at the end our len == 0, we're great! 
# if at any point we try to pop from an empty stack... uh oh
# AND in the context of the closure checker: 
# if what we pop is unexpected or out of qorder.. big trouble!

openers <- c("(", "{", "[", "<p>", "<h1>", "<title>")
closers <- c(")", "}", "]", "</p>", "</h1>", "</title>")

# I want you to implement a *stack*. The tests for your stack are already written!


# here's the plan of attack: we're going to loop over the string with a moving window
# this moving window can change size according to the lengths of the openers and closers!
# lets have a crack at some practice exercies before we try to implement it
library("hashmap")
source("Stack.R")

Checker_ <- setRefClass("Checker",
        fields = list(openers = "vector", closers = "vector", 
        closureDict = "ANY", ourStack = "Stack_"),
        methods = list(

            checkString = function(string){
                return(TRUE)
            },

            # create list of string vectors by length
            ncharTable = function(){

                # gather all patterns and sort them
                allPats <- union(openers, closers)
                patLengths <- nchar(allPats) # lengths
                allPats <- allPats[order(patLengths)] # sort strings by length

                # declare the table based on unique string lengths
                uniques <- unique(patLengths)
                howManyUnique <- length(uniques)
                patTable <- vector("list", howManyUnique)

                # fill in the table 
                for( i in 1:howManyUnique){
                    patTable[[i]] <- Filter(function(x) nchar(x) == uniques[i], allPats)
                
                }

                return(patTable)
            }

            # use any(haystack == needle) not is.element(needle, haystack)

            


        ))

Checker <- function(os, cs){
    newChecker <- Checker_$new(openers = os, closers = cs, 
    closureDict = hashmap(cs, os), ourStack = Stack() )
    return(newChecker)
}


smallo <- c("(", "<p>")
smallc <- c(")", "<p/>")
table <- list( c("(", ")"), c("<p>"), c("<p/>") )
sampleString <- "<p> welcome to (my house) <p/> stranger()"

uniqueLengths <- unique(nchar(union(smallo, smallc)))
howManyUnique <- length(uniqueLengths)


starts <- c()
ends <- c()
emptySpaces <- paste(rep(" ", 4), collapse = "")
sampleString <- paste0(sampleString, emptySpaces)
for(start in 1:nchar(sampleString)){
    for(lenIndex in 1:howManyUnique){
        patternLength <- uniqueLengths[lenIndex]
        end <- start + patternLength - 1 # minus 1 because inclusion
        tinyStr <- substr( sampleString, start, end)
        print(tinyStr)
        # starts <- c(starts, start)
        # ends <- c(ends, end)
    }
}

# [1]  1  1  1  2  2  2  3  3  3  4  4  4  5  5  5  6  6  6  7  7  7  8  8  8  9
#  [26]  9  9 10 10 10 11 11 11 12 12 12 13 13 13 14 14 14 15 15 15 16 16 16 17 17
#  [51] 17 18 18 18 19 19 19 20 20 20 21 21 21 22 22 22 23 23 23 24 24 24 25 25 25
#  [76] 26 26 26 27 27 27 28 28 28 29 29 29 30 30 30 31 31 31 32 32 32 33 33 33 34
# [101] 34 34 35 35 35 36 36 36 37 37 37 38 38 38 39 39 39 40 40 40 41 41 41
# > ends
#   [1]  1  3  4  2  4  5  3  5  6  4  6  7  5  7  8  6  8  9  7  9 10  8 10 11  9
#  [26] 11 12 10 12 13 11 13 14 12 14 15 13 15 16 14 16 17 15 17 18 16 18 19 17 19
#  [51] 20 18 20 21 19 21 22 20 22 23 21 23 24 22 24 25 23 25 26 24 26 27 25 27 28
#  [76] 26 28 29 27 29 30 28 30 31 29 31 32 30 32 33 31 33 34 32 34 35 33 35 36 34
# [101] 36 37 35 37 38 36 38 39 37 39 40 38 40 41 39 41 42 40 42 43 41 43 44