

# miscellaneous 

misc_1 <- function(A, B) A**0.5 + B**2

misc_2 <- function(C, D) C(D + 4)

misc_3 <- function(E){
    function(){
        E <<- E + 1; E
    }
} 



# loop examples (4)

loop_1 <- function(X){
    for( xx in seq_along(X) ){
        x <- X[xx]
        X[xx] <- x + 1
        rm(x)
    }
    X
}

loop_2 <- function(Y, F){
    for(yy in seq_along(Y)){
        y <- Y[yy]
        Y[yy] <- ( F(y) + 8 )/3 
        rm(y)
    }
    y
}

loop_3 <- function(Z){
    invalid <- function(x) is.null(x) || is.na(x)
    while( !invalid(Z[1]) ) print(Z[1]); Z <- Z[-1]
}

loop_4 <- function(Z){
    invalid <- function(x) is.null(x) || is.na(x)
    while( !invalid(Z[1]) ) print(Z[1]); Z <- Z[1]
}

# please answer with strings

answers <- list(

    misc_1_ans = c()
    misc_2_ans = c()
    misc_3_ans = c()

    loop_1_ans = c()
    loop_2_ans = c()
    loop_3_ans = c()
    loop_4_ans = c()

)



# ANSWER KEY, NO PEEKING!

answers <- list(

    misc_1_ans = c("A", "C")
    misc_2_ans = c("A", "B", "F")
    misc_3_ans = c("A", "D")

    loop_1_ans = c("A", "C")
    loop_2_ans = c("A", "B", "G")
    loop_3_ans = c("A", "E")
    loop_4_ans = c("A", "G")

)


