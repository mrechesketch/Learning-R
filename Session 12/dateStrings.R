
testStr_1 <- "2017-09-29 18:46:40"
testStr_2 <- "2017-05-03 18:46:40"
testStr_3 <- "2017-06-16 18:46:40"

# we want to turn the above into september, may and june respectively. 
# an obvious place to start would just be a function that takes in
# a two character month code and returns the months name

monthCodeToName <- funtion(code){
    if(code == "01"){
        return("January")
    }
    return("Not January")
}

problem_1 <- function(){
    stopifnot( monthCodeToName("09") == "September" )
    stopifnot( monthCodeToName("05") == "May" )
    stopifnot( monthCodeToName("06") == "June" )
    stopifnot( monthCodeToName("01") == "January" )
    stopifnot( monthCodeToName("03") == "March" )
    stopifnot( monthCodeToName("10") == "October" )
    print("problem_1 complete")

}

# this function is a just a bunch of if conditonals.. nothing too scary

# ok so that function wasn't that bad. Lets now make a function that takes
# in the whole date string and returns the month code

dateStrToMonthCode <- function(dateStr){
    return(dateStr)
}

# I'm not going to give you that much help on this function.. I think it can be written
# in one line... try using strsplit on "-" and then indexing to the correct item.. See Session 3/variousFunctions.R
# for the spongebob memer. it uses strsplit! 

problem_2 <- function(){
    stopifnot( dateStrToMonthCode(testStr_1) == "09" )
    stopifnot( dateStrToMonthCode(testStr_2) == "05" )
    stopifnot( dateStrToMonthCode(testStr_3) == "06" )
    print("problem_2 complete")
}

# REMEMBER TO source("dateStrings.R") AND ACTUALLY RUN THESE COMMANDS IN THE INTERPRETTER