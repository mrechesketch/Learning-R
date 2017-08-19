# practice for closure checker

# hash table creation!
# whenever we do a pop operation we need to make sure  we 
# are getting what we expect..

# given a two string-vectors, create a hashtable where 
# the second vector elements are keys and the first vector elements are values

openers <- c("(", "{", "[", "<p>", "<h1>", "<title>")
closers <- c(")", "}", "]", "</p>", "</h1>", "</title>")

# does the hashmap come with a useful constructor? maybe...
closerDict <- hashmap(closers, openers)

exercise_1 <- function(){
    stopifnot( setequal(closerDict$keys(),closers)) 
    print("exercise_1 complete!")
}

# so when we are making our moving window.. we'll need to know how big it is
# given two vectors of openers and closers return a vectors of the lengths of the strings

getLengths <- function(openers, closers){
    # useful functions: sapply with nchar(x) [not length(x)]
    # use union to merge sets and preserve uniqueness
    return(c())
}

exercise_2 <- function(){
    characterLengths <- getLengths(openers, closers)
    stopifnot( setequal(characterLengths,c(1,2,4,7,5,8)) )
    print("exercise_2 complete")
}

# now we are going to practice moving a window over a string

sequence <- "GATCATAGCACATAGGACA" 
stopCodon <- "TAG"
# hint: for both of these you will want substr(string, start, stop)

# how many times does the stop codon appear
howMany <- function(sequence, pattern){
    len <- nchar(pattern)
    counter <- 0
    for(i in 1:(nchar(sequence)-len)){
        window <- substr(sequence, i, (len-1+i)) #moving window
        if( window == pattern){
            counter <- counter+1
        }

    }
    return(counter)
}

# return the string up to the stop codon
upToFirst <- function(sequence, pattern){
    len <- nchar(pattern)
    for(i in 1:(nchar(sequence)-len)){
        window <- substr(sequence, i, (len-1+i)) #moving window
        if( window == pattern){
            return(substr(sequence, 1, (i-1)))
        }
    }
    return(FALSE)
}

exercise_3 <- function(){
    stopifnot(howMany(sequence, stopCodon) == 2)
    stopifnot(upToFirst(sequence, stopCodon) == "GATCA")
    print("exercise_3 complete")
}


