

# ===================================================================== #
# ==================== #### Fizz Buzz Vector ##### ==================== #
# ===================================================================== #


# this problem is similar to the Fizz Buzz problem we did earlier
# instead of printing all the elements I want a vector 
# your output should look something like below:

# c("1", "2", "Fizz", "4", "Buzz", 
#   "Fizz", "7", "8", "Fizz", "Buzz", "11", 
#   "Fizz", "13", "14", "Fizz Buzz")

# I'll provide you with a snazzy numToFizzBuzz function

numToFizzBuzz <- function(num){
    div3 <- num %% 3 == 0
    div5 <- num %% 5 == 0
    if( !(div3 || div5) ){
        return(as.character(num))
    }
    fizz <- if(div3) "Fizz" else character(0)
    buzz <- if(div5) "Buzz" else character(0)
    return( paste(c(fizz, buzz), collapse = " ") ) 
}

# PROBLEM 1 TODO'S
# create a fizz-buzzy vector 1 through N
# A: using a loop
# B: using sapply
# C: understand numToFizzBuzz and be able to explain how it works
# D: can we do this with vectorization??? Extra credit :)

fizzBuzzLoop <- function(N){
    return( c(1:N) )
}

fizzBuzzApply <- function(N){
    return( c(1:N) )
}

problem_1 <- function(){
    stopifnot( identical(fizzBuzzLoop(1), c("1") ) )
    stopifnot( identical(fizzBuzzApply(1), c("1") ) )
    testVect <- c("1", "2", "Fizz", "4", "Buzz",
    "Fizz", "7", "8", "Fizz", "Buzz", "11", 
    "Fizz", "13", "14", "Fizz Buzz")
    stopifnot( identical(fizzBuzzLoop(15), testVect ) )
    stopifnot( identical(fizzBuzzApply(15), testVect ) )
    print("problem_1 complete")
}


# ===================================================================== #
# ==================== #### S4 vs Ref Class! ##### ==================== #
# ===================================================================== #

# for more reading see:
# http://adv-r.had.co.nz/S4.html - S4 on inheritance
# http://adv-r.had.co.nz/R5.html - Ref classes
# http://www.cyclismo.org/tutorial/R/s4Classes.html - more S4 and kinda wrong but still helpful


# I'm  going to define an S4 class below 
Animal <- setClass(
    # we set the name
        "Animal", 
    # define the slots (AKA fields)
        slots = c(
            age = "numeric"
        ),
    # default construction!
    prototype = list(
        age = 0
    ),

    # internal check.. not that important in this example
    validity = function(object){
        return( if( object@age < 0) "Age must be positive dummy!" else TRUE )
    }
        )

# you have to reserve the name
setGeneric(name="growUp",
            def=function(this){
                standardGeneric("growUp")
            })

# before you define it
setMethod(f="growUp", 
        signature(this = "Animal"),
        function(this)
        {
            this@age <- this@age + 1
            validObject(this)
            return(this)
        }
            )

# INHERITANCE!! 
PerSon <- setClass(
    # Set the name
            "PerSon",
    # Inherits from 
            contains = "Animal",
    # extend slots
            slots = c(
                name = "character",
                profession = "character"
            ),
    # default construction!
            prototype = list(
                name = "Bob",
                age = 34,
                profession = "builder"
    ), )



# and now the ref class we know and love
PeRson_ <- setRefClass(
    # set the name
        "PeRson",
    # define the fields 
        fields = list(
            name = "character",
            age = "numeric",
            profession = "character"),
    # define methods
        methods = list(

            growUp = function(){
                age <<- age + 1
            }

        ))

# our make shift constructor 
PeRson <- function(n, a, p){
    return(PeRson_$new(name = n, age = a, profession = p))
}

# and now an _illuminating_ example

    #Ref class
refClassAlex <- PeRson("Alex", 22, "unemployed")
alex <- refClassAlex
schmalex <- refClassAlex$copy() # where TF does this copy method come from??


    #S4 
S4ClassTaylor <- PerSon(name = "Taylor", age = 27, profession = "analyst")
taylor <- S4ClassTaylor

    # more S4 -- check this stuff out for yourself..
    # the following example won't use these
defaultPerson <- PerSon()
bobsTwinBill <- PerSon(name = "Bill", profession = "contractor")


# for the following booleans please indicate T or F
# make sure you understand why they are T or F!
refClassSameness_1 <- identical(refClassAlex, alex) # T or F
refClassSameness_2 <- identical(alex, schmalex) # T or F

alex$growUp()
sameAge_1 <- alex$age == refClassAlex$age # T or F
sameAge_2 <- alex$age == schmalex$age # T or F

vec_1 <- c(alex)
vec_2 <- list(alex)
alex$growUp()
refClassAlex$growUp()

sameAge_3 <- (vec_1[[1]]$age == vec_2[[1]]$age) # T or F
sameAge_4 <- alex$age == 24 # T or F
refClassSameness_3 <- identical(vec_1[[1]], vec_2[[1]]) # T or F
refClassSameness_4 <- identical(vec_1[[1]], alex) # T or F
wtf_1 <- identitcal(vec_1, vec_2) # T or F
wtf_2 <- identitcal(c(), list()) # T or F


S4ClassSameness_1 <- identical(S4ClassTaylor, taylor) # T or F

vec_3 <- c(taylor)
taylor <- growUp(taylor)

S4ClassSameness_2 <- identical( vec_3[[1]], taylor) # T or F
sameAge_5 <- vec_3[[1]]@age == taylor@age # T or F


# Extra Credit: redo exercise 1 from Sesion 8 review (the hashtable of word counts)
# using a factor data type : https://www.stat.berkeley.edu/classes/s133/factors.html
# there is a very similar example!








