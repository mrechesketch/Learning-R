# Similar to how locations can have paths between them, people can have relationships
# in this exercise, we will explore how to find out friends of friends

person_ <- setRefClass("person_",

                    fields = list(
                        ID = "character", 
                        friends = "ANY"),
                        
                    methods = list(
                        
                        addFriend = function(friendID){
                            # i know i said don't do this but we will make it better i promise
                            friends <<- append(friends, friendID) 
                        },

                        getFriends = function(){
                            # good practice to never directly access member variables
                            return(friends) 
                        }

                    ) )

Person <- function(ID){
    person_$new(ID = ID, friends = character(0) )
}

# see friendGraph.png for visualization

# top
H1 <- Person('1')
H2 <- Person('2')
H4 <- Person('4') 
C3 <- Person('3')
# middle
H5 <- Person('5')
C6 <- Person('6')
O7 <- Person('7')
H8 <- Person('8')
# bottom
H9 <- Person('9')
H11 <- Person('11')
H12 <- Person('12') 
C10 <- Person('10')

# define relationships
graph <- list(
# top methyl group
    c(C3, H1), c(C3, H2), c(C3, H4),
# bridge
    c(C3, C6),
# middle
    c(C6, H5), c(C6, O7), c(O7, H8),
# bridge
    c(C6, C10),
# bottom methyl group
    c(C10, H9), c(C10, H11), c(C10, H12)
)

# set the relationships
for (pair in graph){
    pOne <- pair[[1]]
    pTwo <- pair[[2]]
    pOne$addFriend(pTwo$ID)
    pTwo$addFriend(pOne$ID) 
}

# construct table
peoples <- list(H1, H2, C3, H4, H5, C6, O7, H8, H9, C10, H11, H12)

# the point of this table is to be able to look people up by their ID
# notice how H1 goes in the [[1]] spot and so on...

getPerson <- function(ID){
    return( peoples[[as.integer(ID)]] )
}

# THE ABOVE FUNCTION WILL HELP YOU ON THE PROBLEM BELOW

# TODO, write this function
# Recursion, while not the most effecient approach, is probably the easiest
# what is your base case? HINT: when N == 1, just return getFriends()!
# recursive case: ask all of your friends to get their friends(N-1)
# sapply is good for doing this easily but you might need unlist() to get the vector form
# use union to join two lists together and make a set: https://stat.ethz.ch/R-manual/R-devel/library/base/html/sets.html
# you can use setdiff to remove see: https://stackoverflow.com/questions/9665984/how-to-delete-multiple-values-from-a-vector
getNthOrderFriends <- function(ID, N){
    stopifnot(N > 0) # we can't ask for anything less that 1st order

    # gather the person
    person <- getPerson(ID)
    myFriends <- person$getFriends()
    return( myFriends )
}

firstO <- c('1', '2', '4', '6')
secondO <- c( firstO, '5', '7', '10')
thirdO <- c(secondO, '8', '9', '11', '12')

out1 <- getNthOrderFriends('3', 1)
out2 <- getNthOrderFriends('3', 2)
out3 <- getNthOrderFriends('3', 3)

passFail <- function(Out, Ex) if ( setequal(Out, Ex) ) "PASS" else "FAIL" 
print("I encourage you to write some tests for yourself")
cat("The 1st order friends of C3 are:", out1, passFail(out1, firstO), "\n" )
cat("The 2st order friends of C3 are:", out2, passFail(out2, secondO), "\n" )
cat("The 3st order friends of C3 are:", out3, passFail(out3, thirdO), "\n" )



