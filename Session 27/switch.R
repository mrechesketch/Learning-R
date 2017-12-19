

ccc <- c("b","QQ","a","A","bb")

ex_1 <- function(){
    for( ch in ccc){
        cat(ch,":", switch(EXPR = ch, a = 1, b = 2:3), "\n")   
    }
}



# and now something else

ex_2 <- function(){
    for( ch in ccc){
        cat(ch,":", switch(EXPR = ch, a =, A = 1, b = 2:3, "default evaluation"), "\n")   
    }
}
