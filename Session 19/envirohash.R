
# we're going to manipulate environments to create a hash set class(!!!)

# you will notice the bodies of the functions are quite short
# they are merely wrappers for the built-in environment functions
# they have existed this whole time right under our noses!

Set_ <- setRefClass("Set_",
            fields = list(
                env = "ANY"
            ),
            
            methods = list(

                elements = function() ls(env),

                has = function(element){
                    # you haven't seen a tryCatch before
                    tryCatch({
                        # if you ask to get an element that doesn't exist
                        value <- get(element, env)
                        # then the above line returns an error
                        is.na( value ) # this gets returned if it's not an error
                    },
                    error = function(cond) FALSE # if it is an error, this gets returned
                    )
                },

                add = function(element) assign(element, NA, env),

                delete = function(element) remove(list = element, envir = env)
            ) )

Set <- function() Set_$new( env = new.env() )


# here is a 

# declare the set
s <- Set()
# add one element
s$add("ok")
stopifnot( s$has("ok") ) # ok is an existing element
stopifnot( !s$has("what") ) # what does not exist
# s$elements returns [1] "ok" because that's the only element
# ***adding the same element multiple times doesn't do anything***
s$add("ok")
# you can only delete things that exist
s$delete("ok") # lest you get an error
# s$delete("ok") would return an error
# s$elements() to get all the items in the set

# and now the functions to write... SET OPERATIONS!

# starting with an example

# union with infix (see http://adv-r.had.co.nz/Functions.html @ Infix Functions if you need to freshen up)
# U takes in two sets and returns a third set which is the union of the first two
`%U%` <- function(A, B){ # do not be afraid of the funky `tick marks` this is an infix operator
    C <- Set() # create an empty set
    for( item in A$elements() ) C$add(item) # add from A
    for( item in B$elements() ) C$add(item) # add from B
    return( C ) # return set C, the union of set A and set B
}

# sub takes in A and B and says TRUE A is a subset of B (FALSE otherwise)
`%sub%` <- function(A, B){
    for( item in A$elements() ){
        if( !B$has(item) ) return( FALSE )
    }
    return( TRUE ) 
} # should take 3 - 4 lines of code.. could do 2 if you really wanted

# super takes in A and B and says if A is a superset of B (how could you leverage sub??)
`%super%` <- function(A, B) B %sub% A # takes 1 line if you leverage %sub%


# A += B will add all the elements in B into A but does not return anything
`%+=%` <- function(A, B) for( item in B$elements() ) A$add(item) 
# body takes 1 - 2 lines.  


# intersect operator (returns a set of shared elements)
`%I%` <- function(A, B){
    C <- Set()
    for( item in A$elements() ) if( B$has(item) ) C$add(item)
    for( item in B$elements() ) if( A$has(item) ) C$add(item)
    return( C )
}

# exclude operator (returns a set of un-shared elemets )
# it's the opposite of intersect... A <- {1, 2, 3} & B <- {2, 3, 4}.. A %E% B <- {1, 4}
`%E%` <- function(A, B){
    C <- Set()
    for( item in A$elements() ) if( !B$has(item) ) C$add(item)
    for( item in B$elements() ) if( !A$has(item) ) C$add(item)
    return( C )

ok <- Set()
for( n in 1:10 ) ok$add( as.character(n) )
o <- Set()
for( n in 1:5 ) o$add( as.character(n) )
hmm <- Set()
for( n in 5:15 ) hmm$add( as.character(n) )
