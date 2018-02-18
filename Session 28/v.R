# capacity - int
# size - int
# contents - array

v <- setRefClass(

    Class = "v",

    fields = list(
        capacity = "integer",
        size = "integer",
        contents = "ANY",
        type = "character"
    ),

    methods = list(

        initialize = function( mode = "list" ){
                type <<- mode # default type is list for maximum flexibility
                size <<- 0L
                contents <<- NULL
                capacity <<- 0L
            },
        
        show = function() print(contents[1:size]),

        push_back = function(key){
            # empty case
            if(is.null(contents)){
                capacity <<- capacity+1L
                contents <<- vector(type, capacity)
            }
            #resizing
            else if(size == capacity){
                capacity <<- capacity*2L
                newContents <- vector(type, capacity)
                newContents[1:size] <- contents
                contents <<- newContents
            }
            # default
            size <<- size+1L
            contents[size] <<- key
        },

        pop_back = function(){
            element <- contents[size]
            size <<- size-1L
                if(size == 0L){
                    capacity <<- capacity-1L
                    contents <<- NULL
                }
                else if(size <= capacity/2L){
                    capacity <<- as.integer(capacity/2L)
                    newContents <- vector(type, capacity)
                    newContents <- contents[1:size]
                    contents <<- newContents
                }
                return(element)
        }

            )  
)

setMethod(f = "[", 
        signature = "v", 
        function(x, i, j = NULL, ..., drop = TRUE){
            subset <- if( is.null(j) ) i else i:j
            x$contents[subset]
        })



pro <- v("integer")

for( i in 1:10L ) pro$push_back(i)