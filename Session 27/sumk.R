
# find all combinations of two numbers in an array that sum to k
# return them in (min, max) order

array_1 <- 5:0

k <- 5

sum_k <- function (array_1){
    array_1 <- sort( array_1, decreasing = FALSE)
    minV <- integer(0)
    maxV <- integer(0)
    for( i in 1:length(array_1)){
        #that sweet sweet 1/2 base times hight
        for( j in i:length(array_1)){
            hopefully5 <- array_1[i] + array_1[j]
            if( hopefully5 == k){
                minV <- append(minV, array_1[i])
                maxV <- append(maxV, array_1[j])
            }
        }
    }
    return (list(MiN = minV, MAX = maxV))
}
