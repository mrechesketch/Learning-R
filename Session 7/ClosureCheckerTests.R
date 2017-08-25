source("ClosureChecker.R")

# Stack_ tests


# constructor test

stackConstructorTest <- function(){
    newStack <- Stack()
    stopifnot(newStack$isEmpty())
    stopifnot( identical(newStack$head, NULL) )
}

# push test

pushTest <- function(){
    newStack <- Stack()
    newStack$push("(")
    newStack$push("{")
    newStack$push("<p>")
    stopifnot(newStack$len == 3)
    stopifnot(newStack$head$data == "<p>")
}

# pop test 
popTest <- function(){
    newStack <- Stack()
    newStack$push("(")
    newStack$push("{")
    newStack$push("<p>")
    newStack$pop()
    newStack$pop()
    last <- newStack$pop()
    stopifnot(last$data == "(")
    stopifnot(newStack$isEmpty())
    uhoh <- newStack$pop()
    stopifnot( identical(uhoh, NULL) )
}

# run stack tests 

stackTests <- function(){
    stackConstructorTest()
    pushTest()
    popTest()
    print("STACK TESTS PASSED")
}



openers <- c("(", "{", "[", "<p>", "<h1>", "<title>")
closers <- c(")", "}", "]", "</p>", "</h1>", "</title>")
checker <- Checker(openers, closers)

emptyTest <- function(){
    stopifnot(checker$checkString(""))
    print("empty test passed")
}