# paste your code here
# problem 1

# In this problem you are going to make your own version of strsplit using Map
# here is a reminder on what strsplit does: https://stat.ethz.ch/R-manual/R-devel/library/base/html/strsplit.html

# input: strsplit("hello", "") 
# output: [[1]]
# [1] "h" "e" "l" "l" "o"

# input: strsplit("hello", "l") 
# output: [[1]]
# [1] "he" "" "o"

# Recall that Map takes in a function and two vectors. In this case, the vectors should be equal length
# (in general the vectors do not have to be equal length but the longer should at least be a multiple of the smaller)

# Think about what the function and vectors will be; this problem is similar to Session 7's homework 
# that problem is where we split a N length vector into M parts where M < N

sampleString <- "land of the free and home of the slaves"

# lets assume we want to split on spaces
indicesOfSpaces <- c(5, 8, 12, 17, 21, 26, 29, 33)

land <- substr(sampleString, 1, 4)
of_1 <- substr(sampleString, 6, 7)
the_1 <- substr(sampleString, 8, 11)
free <- substr(sampleString, 13, 16)
and <- substr(sampleString, 18, 20)
home <- substr(sampleString, 22, 25)
of_2 <- substr(sampleString, 27, 28)
the_2 <- substr(sampleString, 30, 32)
slaves <- substr(sampleString, 34, 39)

outputOfSplittingOnSpace<- list( land, of_1, the_1, free, and, home, of_2, the_2, slaves )
#outputOfSplittingOnSpace

# in the example above, I manually typed out all of the function calls map should be doing
# the two vectors Map uses are are featured as the START and STOP indices
# we could create these vectors fairly easily if we know the indices 

# create a function that finds all the indices of a character within a string
# you can't use strsplit!
# I did it in two steps:
# ======================== STEP 1 =========================
# Step 1: split the string into a character vector:
#   e.g. "racecars" --> c("r", "a", "c", "e", "c", "a", "r", "s")
#   I achieved this with vapply, nchar, and substr
#   remember substr("hello", 1, 1) --> "h"
#   see substr: https://www.rdocumentation.org/packages/base/versions/3.4.1/topics/substr

charVectorize <- function(word) sapply(1:nchar(word), function(x) substr(word, x, x))



charVectorizeTest <- function(){
    emptyString <- ""
    bob <- "bob"
    racecars <- "racecars"

    bobVec <- c("b", "o", "b")
    racecarsVec <- c("r", "a", "c", "e", "c", "a", "r", "s")
    
    stopifnot(charVectorize(emptyString) == c() )
    stopifnot(charVectorize(bob) == bobVec )
    stopifnot(charVectorize(racecars) == racecarsVec )
    
    print( "char vectorize test passed" )
}
# ======================== STEP 2 =========================
# Step 2: use grep

# see grep for help: https://www.rdocumentation.org/packages/base/versions/3.4.1/topics/grep

getIndices <- function(charToSplitOn, word) grep(charToSplitOn,charVectorize(word))
        

getIndicesTest <- function(){
    
    bob <- "bob"
    racecars <- "racecars"
    DNA <- "GATTACCGATAGCAAGTATCGA"
    
    bIds <- c(1, 3)
    rIds <- c(1, 7)
    AIds <- c(2, 5, 9, 11, 14, 15, 18, 22)
    GIds <- c(1, 8, 12, 16, 21)
    
    stopifnot( getIndices("b", bob) == bIds )
    stopifnot( getIndices("r", racecars) == rIds )
    stopifnot( getIndices("A", DNA) == AIds )
    stopifnot( getIndices("G", DNA) == GIds )
    
    print( "get Indices Test complete" )
}

# now that you have a getIndices function, I will let you figure out the rest of how to write mySplit
# but I will leave you these hints:
    # the start vector begins with 1 and all other elements are +1 the getIndices output
    # the stop vector ends with nchar(string) and all other elements are -1 the getIndices output
    # it is acceptable to use starts <- c(1, starts) to insert 1 at the beginning of a vec
    # or conversely ends <- c(ends, nchar(word) ) to append something at the end
    # YOU CAN'T USE STRSPLIT!! that's not the point of this exercise!!
    
    
mySplit <- function(word, splitter){
    starts <- c(1, getIndices(splitter, word) +1)
    ends <- c(getIndices(splitter, word) -1 , nchar(word))
    Map(function(x,y) substr(word, x, y), starts, ends)
 }
    # TODO



mySplitTest <- function(){
    bob <- "bob"
    hello <- "hello"
    DNA <- "GATTACCGATAGCAAGTATCGA"
    
    bobOutput <- list("b", "b")
    helloOutput <- list("hell", "")
    DNAOutput <- list("G", "TT", "CCG", "T", "GC", "", "GT", "TCG", "")
    
    stopifnot( identical( mySplit(bob, "o"), bobOutput ) )
    stopifnot( identical( mySplit(hello, "o"), helloOutput ) )
    stopifnot( identical( mySplit(DNA, "A"), DNAOutput ) )
    
    print( "my split passed" )
}

# YOU MAY WANT TO COMMENT THESE OUT 
# run tests
charVectorizeTest()
getIndicesTest()
mySplitTest()




