source("v.R")

source("Cell.R") # for testing

# this class is made to hold S4 object
# it does so by embedding and extracting S4's embedded in lists
S4v <- setRefClass(
    Class = "S4v",
    contains = "v",
    methods = list(
        initialize = function(...) callSuper("list",...),
        push_back = function(key) callSuper( list(key) ),
        pop_back = function() callSuper()[[1]],
        getItem = function(index) callSuper(index)[[1]],
        setItem = function(index, value) callSuper(index, list(value))  
    )
)

soup <- S4v()

addLetters <- function(){
    for( i in seq_along(letters) ){
        soup$push_back( Cell(letters[i], i, i)) 
    }
}

