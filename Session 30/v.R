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

        initialize = function( mode = "list", ... ){
                type <<- mode # default type is list for maximum flexibility
                size <<- 0L
                contents <<- NULL
                capacity <<- 0L
                # add in any items using push_back
                for( item in list(...) ) for(i in item) push_back(i)
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
                    newContents <- contents[1L:size]
                    contents <<- newContents
                }
                return(element)
        },

        getItem = function(index) if(index > size) NA else contents[index], # make it feel like a normal array

        setItem = function(index, value){
            array <- contents[1L:size] 
            array[index] <- value
            contents <<- array
            if(index > size){
                if( index > capacity ) capacity <<- as.integer(index)
                size <<- as.integer(index)
                }
        }  

            )
)

# get item
`[.v` <- function(x, index) x$getItem(index)
# set item
`[<-.v` <- function(x, index, value){
    x$setItem(index, value)
    x # http://adv-r.had.co.nz/Functions.html#special-calls replacement function..
}
# length
setMethod(f = "length",
        signature = "v",
        function(x) x$size
)

# test vecs
v_1 <- v("integer")
for( i in 1:10 ) v_1$push_back(i)


