
# there are 100 doors and they are all set to the same state
# you visit every door and change its state
# you repeat this process but every time you do so
# the doors you visit changes according to how many times you've already visited the doors
# the first time you visit every door: 1, 2, 3, 4 ...
# the second time you visit the even doors: 2, 4, 6, 8...
# the third time you visit doors 3, 6, 9...
# and so on
# Do this 100 times
# what is the final state of all the doors

#all start TRUE
#after first time all are FALSE
stateOfDoors <- logical(100)

for(i in 1:100){
    doorVec <- Filter(function(x) x %% i == 0 , 1:100)
    stateOfDoors[doorVec] <- !stateOfDoors[doorVec]
}

for(i in 1:100){
    cat(i, stateOfDoors[i], "\n")
}
