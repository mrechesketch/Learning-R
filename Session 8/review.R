library("hashmap")

sentence <- "the moon is blue but the sun is red"



wordCounter <- function(sentence){
        hashmap <- hashmap("$", 0)
        hashmap$clear()
        words<- unlist(strsplit(sentence," "))
        for(i in 1:(length(words))){
            word <- words[i]
            if(hashmap$has_key(word)){
                hashmap[[word]] <- hashmap[[word]]+1
            }
            else{
                hashmap$insert(word, 1)
            }
        }
        return(hashmap)
}


d <- wordCounter(sentence)

numList <-c(1,8,20,3)

normalizer <- function(numList){
        summary <- sum(numList)
        return(numList/summary)
}

h <- normalizer(numList)

newList <- c(6,8,10,13,12,8,11)

diffMaster300 <- function(newList){
        diffVec <- diff(newList)
        listLen <- length(newList)
        newList[1] <- diffVec[1]
        newList[listLen] <- diffVec[listLen-1]
        for(i in 2:(listLen-1)){
           newList[i] <- ((diffVec[i]+diffVec[i-1])/2)
        }
        return(newList)
}

k <- diffMaster300(newList)

evensOnly <- function(numVec){
    if (length(numVec)==0){
        return(c())
    }
    if (numVec[1] %% 2 == 0){
        # it is divisible by 2, append!
        return(c(numVec[1], evensOnly(numVec[-1])))
    }
    else{
        return(evensOnly(numVec[-1]))
    }
}

reverseList <- function(listy){
    if (length(listy) ==0){
        return(c())
    }
    listy[1]
    return(c(reverseList(listy[-1]), (listy[1])))
}

q <- reverseList(newList)
