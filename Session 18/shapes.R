

Element_ <- setRefClass("Element_",
                        
                        fields = list(
                            repr = "character",
                            coordinates = "ANY"),
                        
                        methods = list(
                            defect = function(){
                             repr <<- "X"   
                            }),
                        )

Element <- function() Element_$new(repr = "O", coordinates = "NULL")

Elements <- function(howMany) lapply( 1:howMany, function(x) Element() )

MultiElement_ <- setRefClass("MultiElement",
                            
                            fields = list(
                                length = "numeric",
                                size = "numeric", # size is a function of length
                                
                                elements = "list",
                                defected = "list",

                                data = "matrix"),
                            
                            methods = list(

                                addDefect = function(){
                                    index <- function(N) floor( runif(1,0,N) ) + 1
                                    # randomly choose an index
                                    id <- index(length)
                                    while( elements[id] == NA ) id <- index(length)
                                    # make the switch
                                    element <- elements[id]
                                    defected[id] <<- element
                                    elements[id] <<- NA
                                    # now defect
                                    element$defect()
                                    data[element$coordinates] <<- element$repr
                                }, 

                                print = function(){
                                    for( row in 1:nrow(data) ){
                                        paste( data[row,], collapse = "" )
                                    }
                                })
                            )

Line <- function(length){
    # intialize the line
    line <- MultiElement_$new(
        length = length, 
        size = length, 
        elements = Elements(length),
        defected = vector("list", length),
        data = matrix(data = " ", nrow = 1, ncol = length) )
    # now fill in the data
    #for( i in 1:length) line$data[1,i] <- line$elements[i]$repr
    return( line ) 
}





# shape <- function(sides){

#     rack <- function(length){

#         if( sides == 1 ) Element()

#         elif( sides == 2 ) Line(length)

#         elif( sides == 3 ) Triangle(length)

#         elif( sides == 4 ) Rhombus(length)

#         elif( sides == 6 ) Hexagon(length)
    
#     }
# }