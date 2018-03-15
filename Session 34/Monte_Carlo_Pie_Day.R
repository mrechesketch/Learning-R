#smartboi pie finder
MCPD <- function(n){
    x <- runif(n, -.5, .5)
    y <- runif(n, -.5, .5)
    magnitude <- ((x**2)+(y**2))
    numerator <- sum(magnitude <= 1/4)
    return((numerator/n)*4)
}
