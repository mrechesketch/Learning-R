source("envirohash.R")

Counter_ <- setRefClass("Counter_", 
                contains = "Set_",

                methods = list(

                    keys = function(){
                        elements() # restatement of elements()
                    },

                    val = function(key){
                        get(key, env) # wrapper for get()
                    },

                    values = function(){
                        sapply( keys(), function(k) val(k) ) # similar to keys() but gets the values instead
                    },

                    add = function(keys){
                        for( key in keys){
                            value <- if (!has(key)) 1 else val(key) + 1
                            assign(key, value, env)
                        }        
                    }

                )
)

Counter <- function(...){
    # the ellipses is used for a *variable* number of arguments
    mySet <- Counter_$new( env = new.env() )
    # any function has nargs() which returns the number of formals (aka parameters)
    if( nargs() > 0){ # if we do Set() that's the empty set so you could skip this stuff
        arguments <- list(...) # turn the ... into a list
        for( item in arguments ) mySet$add(item) # loop through the list and any sub lists bc $add() is flexible ;)
    }
    return( mySet )
}
