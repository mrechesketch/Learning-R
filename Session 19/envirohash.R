
# we're going to manipulate environments as a hash set object(!!!)

Set_ <- setRefClass("Set_",
            fields = list(
                env = "ANY"
            ),
            
            methods = list(

                elements = function(){
                    ls( env )
                },

                add = function(element){
                    assign(element, NA, env)
                },

                has = function(element){
                    tryCatch({
                        is.na( get(element, env) )
                    },
                    error = function(cond){
                        FALSE
                    })
                }
            ) )

Set <- function() Set_$new( env = new.env() )

s <- Set()
s$add("ok")
