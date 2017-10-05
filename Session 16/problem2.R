# paste code here
#R version 3.3.2 
  
print("Hello, world!")



# practice with Reduce

# if I wanted to sum the numbers 1 through 10 I would do it like this

oneThroughTenSum <- Reduce( function(x,y) x+y, c(1:10) ) 

# write a factorial function using reduce

factorial <- function(num) Reduce( function(x, y) x*y, c(1:num)) 
    # TODO

facTest <- function(){
    stopifnot( factorial(1) == 1 )
    stopifnot( factorial(3) == 6 )
    stopifnot( factorial(5) == 120 )
    
    print( " fact tests complete!" )
}

facTest() # you might want to comment this out until factorial is written

# now lets decode the message in this mystery vector
mysteryVec <- c("fn", "ua", "cm", "k ", "iy", "np", "gp", " i", "tr")

# lets write a function called midInsert that inserts a string into the middle of the first

# midInsert( "hell", "heaven" ) ---> "heheavenll"
# midInsert( "why", "cuz") --> "wcuzhy" always round down (aka floor)

midInsert <- function(bun, burger){     
    bunLen <- nchar(bun)
    start <- substr(bun, 1, floor(bunLen*0.5))
    end <- substr(bun, floor(bunLen*0.5)+1, bunLen)
    paste0(start, burger, end)
} 

Reduce( function(x, y) midInsert(x, y), mysteryVec)
    

# hint: use paste0, nchar and substr

# now combine with Reduce and decode the mystery!