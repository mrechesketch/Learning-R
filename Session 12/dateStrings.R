
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
    if(code == "02"){
        return("February")
    }
    return("Not February")
    if(code == "03"){
        return("March")
    }
    return("Not March")
    if(code == "04"){
        return("April")
    }
    return("Not April")
    if(code == "05"){
        return("May")
    }
    return("Not May")
    if(code == "06"){
        return("June")
    }
    return("Not June")
    if(code == "07"){
        return("July")
    }
    return("Not July")
    if(code == "08"){
        return("August")
    }
    return("Not Agust")
    if(code == "09"){
        return("September")
    }
    return("Not September")
    if(code == "10"){
        return("October")
    }
    return("Not October")
    if(code == "11"){
        return("November")
    }
    return("Not November")
    if(code == "12"){
        return("December")
    }
    return("Not December")
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