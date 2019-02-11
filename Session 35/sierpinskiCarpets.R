#Written by Allan Roberts, Feb 2014
library(ggplot2)
library(grid)

SierpinskiCarpet <- function(k){
    Iterate <- function(M){
        A <- cbind(M,M,M);
        B <- cbind(M,0*M,M);
        return(rbind(A,B,A))
    }
    M <- as.matrix(1)
    for (i in 1:k) M <- Iterate(M);
    n <- dim(M)[1]
    X <- numeric(n)
    Y <- numeric(n)
    I <- numeric(n)
        for (i in 1:n) for (j in 1:n){
        X[i + (j-1)*n] <- i;
        Y[i + (j-1)*n] <- j;
        I[i + (j-1)*n] <- M[i,j];
        }

    DATA <- data.frame(X,Y,I)
    p <- ggplot(DATA,aes(x=X,y=Y,fill=I))
    p <- p + geom_tile() + theme_bw() + scale_fill_gradient(high=rgb(0,0,0),low=rgb(1,1,1))
    p <-p+ theme(legend.position=0) + theme(panel.grid = element_blank())
    p <- p+ theme(axis.text = element_blank()) + theme(axis.ticks = element_blank())
    p <- p+ theme(axis.title = element_blank()) + theme(panel.border = element_blank());
    return(p)
}

# construct the quartz windowlib
A <- viewport(0.25,0.75,0.45,0.45)
B <- viewport(0.75,0.75,0.45,0.45)
C <- viewport(0.25,0.25,0.45,0.45)
D <- viewport(0.75,0.25,0.45,0.45)
quartz(height=6,width=6)
print(SierpinskiCarpet(1),vp=A)
print(SierpinskiCarpet(2),vp=B)
print(SierpinskiCarpet(3),vp=C)
print(SierpinskiCarpet(4),vp=D)