
source("BST.R")

myTree <- BST()
howMany <- 25
randomNumbers <- runif(howMany, 0, 1) # 25 random numbers between 0 and 1

for(i in 1:howMany){
    myTree$insert(randomNumbers[i])
}

sizes <- numeric(howMany)