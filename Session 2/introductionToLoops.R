nv1 <- c(1:10) # 1 through 10 in compact notation!

# remember numeric(0), logical(0) and character(0)?

nv2 <- numeric(length(nv1)) # if the length(nv1) == 0 then we would have the null numeric vector right?

for(i in 1:length(nv1)){
    nv2[i] <- nv1[i]**2
}

# what is the difference if we were to do (taken from https://stackoverflow.com/questions/22235809/append-value-to-empty-vector-in-r)

nv2 <- c()

for(i in 1:length(nv1)){
    nv2[i] <- nv1[i]**2
}

# that was sorta a boring example.. lets go to the next dimension

ourMatrix = matrix( c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3)
anotherMatrix = matrix( c(1,2,3,4,5,6,7,8,9), nrow=3, ncol=3, byrow=3)
# what is the difference between these two?

cols = ncol(ourMatrix) # getting the dimensions for looping
rows = nrow(ourMatrix)

dims <- dim(ourMatrix) # another way to express the above, dims[1] is rows and dims[2] is cols

emptyMatrix = matrix(nrow=cols, ncol=rows)

for(c in 1:cols){
    for(r in 1:rows){
        emptyMatrix[c, r] <- ourMatrix[c, r] + anotherMatrix[c, r]
    }
}

#print(emptyMatrix) # lets take a peek!
whatIsThis <- ourMatrix + anotherMatrix

# now try printing ourMatrix and anotherMatrix in order using a nested for loop


