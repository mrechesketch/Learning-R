

# this is practice on map, reduce and filter, three hella powerful higher order functions

# ===================== MAP ================== #

# you are already familiar with the apply family
# map lets you go over more than one input in parallel

# example 1

powers <- c(4, 3, 6, 2, 6, 7, 4, 2)

bases <- c(1:8)

exp <- function(b, p) b**p

result <- Map( exp, bases, powers )  

# Map could also potentially zip two things together

# example 2

zipped <- Map( function(x,y) c(x,y), bases, powers)

# if map, filter and reduce were the deathly hallows, map would be the elder wand
# these examples are slightly trivial but you can use your imagination on what is possible ;)


# ===================== FILTER =================== #

# you are already familiar with Filter

# exercise 1: given a string of characters, return the first unique

# on "racecars" you would return "e" because that is the first non-repeated character

# if there are no unique characters or the input string is empty, return character(0)

# I will _graciously_ provide the ingredients to a strCount function

strCount <- function(needle, haystack){
    charVec <- strsplit(haystack, "")[[1]]
    sum(grepl(needle, charVec))
}




# 1. strsplit("racecars")[[1]] ---> c('r', 'a', 'c', 'e', 'c', 'a', 'r', 's')
# 2. grep('c', strsplit("racecars")[[1]] ) -> c(3, 5) -- similar to grepl
# 3. *missing ingredient, rhymes with strength"

# OR 
# 1. this stays the same
# 2. use grepl instead
# 3. sum it all together 


strCountTests <- function(){
    stopifnot( strCount("h", "hey") == 1 )
    stopifnot( strCount("h", "heh hy") == 3 )
    # stopifnot( identical( strCount("h", ""), integer(0) ) )
    print( "strCountTests Passed" )
}


firstUniqueChar <- function(word) Filter(function(x) strCount(x, word) == 1, strsplit(word, "")[[1]])[1]

exercise_1 <- function(){
    stopifnot( firstUniqueChar("racecar") == "e" )
    stopifnot( firstUniqueChar("penis") == "p" )
    stopifnot( firstUniqueChar("aauubbccdffgghiiee") == "d" )
    print( "firstUniqueChar tests passed" )
}

# ====================== REDUCE =========================== #

# reduce is the last but not the least of these three functions

# we haven't worked with it much.. 

# example Reduce( function(x,y) x+y, c(1:10) ) is the same as sum( c(1:10) )
# or more explicitly ((((((((1+2)+3)+4)+5)+6)+7)+8)+9)+10
# if you ever get an interview question about factorial or summing up the first n numbers, use reduce

# lets write a function called midInsert that inserts a string into the middle of the first

# midInsert( "hell", "heaven" ) ---> "heheavenll"
# midInsert( "why", "cuz") --> "wcuzhy" always round down (aka floor)

midInsert <- function(bun, burger){
} 

# hint: use paste0, nchar and substr

# now combine with reduce to make act over a vector of characters

mysteryVec <- c("fn", "ua", "cm", "k ", "iy", "np", "gp", " i", "tr")


