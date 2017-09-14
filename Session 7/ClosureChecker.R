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
            }
        ))

Checker <- function(os, cs){
    newChecker <- Checker_$new(openers = os, closers = cs, 
    closureDict = hashmap(cs, os), ourStack = Stack())
    return(newChecker)
}