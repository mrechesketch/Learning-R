source("envirohash.R")

Counter_ <- setRefClass("Counter_", 
                contains = "Set_",

                methods = list(

                # PARAMS: none 
                # RETURN: return the elements of the set
                # BRIEF: keys is a wrapper for enviroSet's elements() function 
                    keys = function() elements(),

                # PARAMS: CHARACTER key
                # RETURN: return the value assigned to the key in env
                # BRIEF: value is a wrapper for get. Returns error if none
                    value = function(key) get(key, env),

                # PARAMS: none 
                # RETURN: return the values assigned to the keys in env
                # BRIEF: analogous to key()
                    values = function() sapply( keys(), function(key) value(key) ),

                # PARAMS: CHARACTER[] keys  
                # RETURN: none
                # BRIEF: if key exists count += 1 otherwise count = 1
                    add = function(keys){
                        for( key in keys){
                            # some things already exist in our environment.. awkward
                            val <- if ( !has(key) || !is.numeric( value(key) ) ) 0 else value(key)
                            assign(key, val + 1, env)
                        }        
                    },

                # PARAMS: CHARACTER word  
                # RETURN: Counter object 
                # BRIEF: word is split into vector of letters and a 
                #       Counter is constructed on this character vector
                    wordToLetterBag = function(word) Counter( strsplit(word, "") )

                )
)

# PARAMS: ... (STR) 
# RETURN: a Counter object
# BRIEF: create a counter object on a STR[] OR sequence of STR[] 
Counter <- function(...){
    myCounter <- Counter_$new( env = new.env() )
    if( nargs() > 0){ 
        arguments <- list(...) 
        for( item in arguments ) myCounter$add(item) 
    }
    return( myCounter )
}


# TESTS FOR COUNTER DATA STRUCTURE
testVec_1 <- c("a", "b", "c") # "c" is reserved for c() vector shit wtf 
testVec_2 <- c( testVec_1, "a", "a", "b" )
testVec_3 <- as.character( rep(1:4, 4:1) )
bigWord <- "abcdefghijklmnopqrztuvwxyz"


    # Constructor
constructorTest <- function(){
    myCounter <- Counter(testVec_1, testVec_2, testVec_3)
    stopifnot( myCounter$has("a") )
    stopifnot( myCounter$value("a") == 4 )
    stopifnot( myCounter$has("b") )
    stopifnot( myCounter$value("b") == 3 )
    stopifnot( myCounter$has("c") )
    stopifnot( myCounter$value("c") == 2 )

    stopifnot( myCounter$has("1") )
    stopifnot( myCounter$value("1") == 4 )
    stopifnot( myCounter$has("2") )
    stopifnot( myCounter$value("2") == 3 )
    stopifnot( myCounter$has("3") )
    stopifnot( myCounter$value("3") == 2 )
    stopifnot( myCounter$has("4") )
    stopifnot( myCounter$value("4") == 1 )

    print( "constructor passed")

}


    # $keys()
keysTest <- function(){
    myCounter <- Counter()
    stopifnot( myCounter$keys() == character(0) ) # empty vector
    myCounter <- Counter(testVec_1)
    stopifnot( myCounter$keys() == myCounter$elements() )
    print( "keys passed" )
}

    # $add(keys)
# add is implicitly tested in other functions 

    # $value(key)
valueTest <- function(){
    myCounter <- Counter(testVec_2)
    stopifnot( myCounter$value("a") == 3 )
    stopifnot( myCounter$value("b") == 2 )
    stopifnot( myCounter$value("c") == 1 )
    print( "value passed" )
}

    # $values()
valuesTest <- function(){
    myCounter <- Counter(testVec_1)
    stopifnot( myCounter$values() == rep(1, 3) )
    print( "values passed" )
}

    # $wordToLetterBag()

CounterTests <- function(){
    constructorTest()
    keysTest()
    valueTest()
    valuesTest()
}



# NOW WRITE A SUBSET FUNCTION
    


