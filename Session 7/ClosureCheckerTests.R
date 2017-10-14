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
    stopifnot( !newStack$isEmpty() )
    newStack$pop()
    newStack$pop()
    last <- newStack$pop()
    stopifnot(last == "(")
    stopifnot( newStack$isEmpty() )
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





emptyTest <- function(){
    stopifnot(checker$checkString(""))
    print("empty test passed")
}


ncharTableTest <- function(){
    # create target list
    ones <- c("(", "{", "[", ")", "}", "]")
    twos <- c("<p>")
    threes <- c("<h1>", "</p>")
    fours <- c("<title>")
    fives <- c("</h1>")
    sixes <- c("</title>")
    target <- list(ones, twos, threes, fours, fives, sixes)
    # create closure checker 
    openers <- c("(", "{", "[", "<p>", "<h1>", "<title>")
    closers <- c(")", "}", "]", "</p>", "</h1>", "</title>")
    checker <- Checker(openers, closers)
    table <- checker$ncharTable()
    # now check set equality
    stopifnot( length(target) == length(table) ) 
    for(i in 1:length(target)){
        stopifnot( setequal( target[[i]], table[[i]] ) )
    }
    print("ncharTableTest complete!")
}