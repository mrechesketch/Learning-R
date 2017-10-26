source("envirohash.R")

Counter_ <- setRefClass("Counter_", 
                contains = "Set_",

                methods = list(
                    add = function(elements){
                        for( element in elements){
                            if( !has(element)){
                            assign(element, 1, env) 
                            }       
                            else{
                                value <- get(element, env) + 1
                                assign( element, value, env)
                             }           
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
