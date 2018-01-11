FRList <- setRefClass(

        Class = "FRList",

        fields = list(
            size = "integer",
            contents = "ANY",
            type = "character"
        ),

        methods = list(

            initialize = function( mode = "list" ){
                type <<- mode # default type is list for maximum flexibility
                size <<- 0L
                contents <<- NULL
            },

            contains = function(key){
                current <- contents
                while( !is.null(current[[1]]) ){
                    if( current[[1]] == key ) return( TRUE )
                    current <- current[[2]]
                }
                return( FALSE )
            },

            push_back = function(key){
                size <<- size + 1L
                contents <<- list(key, contents)
            },

            # because of it's deeply nested nature.. we'll need is
            asVec = function(){
                outVec <- vector(type, size) # allocate a vector of a certain type
                i <- 1; current <- contents
                while( !is.null(current[[1]]) ){
                    outVec[(size+1) - i] <- current[[1]] # fill in backwards
                    i <- i + 1; current <- current[[2]]
                }
                return( outVec )
            },

            show = function() print( asVec() ),
            

            pop_back = function(){
                # hmm what goes here?
            }
            
        )

)

# and now define [] accessor method
setMethod(f = "[", 
        signature = "FRList", 
        function(x, i, j = NULL, ..., drop = TRUE){
            subset <- if( is.null(j) ) i else i:j
            x$asVec()[subset]
        })


