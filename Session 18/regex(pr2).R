#R version 3.3.2 
  
print("Hello, world!")

# use this cheat sheet.. it's great! https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf

# we're going to build a function that checks if something is a valid username, email address & password

# ======================= PART I: PASSWORDS ======================== #

# we're going to do passwords first because even though the rules seem super fucking complicated
# the ordering doesn't matter so our checker only has to verify parts independently

# a valid password must
#   1. 8 or more characters (hasLength)
#   2. contain an uppercase (hasUpper)
#   3. contain a lowercase (hasLower)
#   4. contain a number (hasNum)
#   5. contain a special character (hasPunct)

# here's an example of determining if something has an alphabetical character

hasAlpha <- function(string) grepl("[A-z]", string) 

# HINT: if you get stuck.. all of the answers are on the cheat sheet!!

# this one you could just use nchar really.. 
hasLength <- function(string) grepl("\\w{8,}", string)

hasUpper <- function(string) grepl("[[:upper:]]", string)

hasLower <- function(string) grepl("[[:lower:]]", string)

hasNum <- function(string) grepl("\\d", string)

# might have to resort to POSIX style here
hasPunct <- function(string) grepl("[[:punct:]]", string)

validPassword <- function(p){
    hasLower(p) && hasNum(p) && hasLength(p) && hasUpper(p) && hasPunct(p)
}


# ======================= PART II: EMAILS ======================== #

# what do emails look like anyway?
#   ex 1: aechevarria@hmc.edu
#   ex 2: lanalove420@gmail.com
#   ex 3: 12skipafew100@yahoo.net
#   ex 4: _alex.echevarria95_@gmail.com ##for the purpose of this exercise

# the above example emails are all valid

# so lets focus on the suffix term
    # all have at least one @ symbol 
    # the @ symbol is followed by only lowercase alphabetical characters 
    # until the "."
    # and lastly we have some valid extensions: com, edu, net etc..

# lets keep it simple and just follow the above rules
# wikipedia has an article on email addresses: https://en.wikipedia.org/wiki/Email_address
# wiki rules look much trickier.. focus on the above listed rules

# however 
#   _alex.echevarria@95_@GMAIL.com would not be because GMAIL is capiltalized 
#   goHawks.gmail.com is missing the @ symbol
#   no-reply@greenhouse.io does not have the correct extension
#   aechevarria@hmc.edu@sluts.NOW contains a valid suffix but this term does not end the string hence, false 

add1 <- "_alex.echevarria@95_@GMAIL.com"
add2 <- "_alex.echevarria95_@gmail.com"

# the extract function is helpful for seeing what pattern is getting matched
extract <- function(patt, string) regmatches(string, regexpr(patt, string, perl = T) )
 

validEmail <- function(email){
    # set pattern and extract string
    emailPattern <- "\\w.+[@]{1}[a-z]+\\.(com|net|edu)"  #"\\w.+@{1}[A-z]+\\.(com|net)"
    # TODO, finish this pattern. it needs work! 
    extracted <- extract(emailPattern, email)
    # set boolean values 
    noMatch <- identical(extracted, character(0) ) # indicates no pattern found
    partialMatch <- extracted == email # a pattern was found but does it exactly match?
    # check empty or fullness of match
    if ( noMatch ) F else partialMatch 
}

# ======================= PART III: USERNAMES ======================== #

# for this section you get to be creative and design your own rules for a valid username

# example suggestion: 
#   1. usernames must contain a double vowel "aa" "ee" "ii" "oo" "uu"
#   2. username can only be alphanumeric (cannot contain punctuation) 

# hence "spleenSplitter69" is valid while "spleen-Splitter69!" is not ok

# TODO: 
#   1. Design a username with at least 3 rules
#       i. Must have a number after a letter
#       ii. Must have "i" after "e"
#       iii. must have at least one of "*,^,%,# "
        
#   2. Write tests for your username
#       i. scroll to the "#=== TESTS for Username ===#" section and model the previous tests
#   3. Write a validUsername function.
#       i. write at least one NEW helper function
#   also free to borrow the helper functions you wrote for validPassword

hasSecure <- function(string) grepl("(*|^|%|#)", string)

hasEndNum <- function(string) grepl("[[:digit:]]$", string)

hasIE <- function(string) grepl("(ie|IE|Ie|iE)", string)

validUsername <- function(username){
    hasSecure(username) && hasEndNum(username) && hasIE(username)
}
  


# Test runner function
runTests <- function(tests){
    for ( test in tests ){

        cat("\n")

        outputs <- sapply(test$inputs, test$funct)
        sames <- outputs == test$expected
        fractionPassed <- paste0( as.character(sum(sames)), "/", as.character(length(test$inputs) ) )
        
        cat(test$message, "Tests", fractionPassed, "\n") # print the message
        
        for( i in seq_along(sames) ){
            if ( !sames[i] ){
                # explain what happened
                cat(" Test", i, "failed", "\n")
                cat("  Input:", test$inputs[i], "\n")
                cat("  Expected:", test$expected[i], "\n")
                cat("  Recieved:", outputs[i], "\n" )
            }
        }
    }
}

# ========= TESTS for Password ============= #

lengthTests <- list(
    message = "hasLength",
    funct = function(w) hasLength(w),
    inputs = c("abc", "9893", "01234567", "HDIENNELLS", "abCdeFgh", "a_90hdSi24D"),
    expected = c(F, F, T, T, T, T)
) 

upperTests <- list(
    message = "hasUpper",
    funct = function(w) hasUpper(w),
    inputs = c("abc", "9893", "0123457", "HDIENNELLS", "abCdeFgh", "a_90hdSi24D"),
    expected = c(F, F, F, T, T, T)
)

lowerTests <- list(
    message = "hasLower",
    funct = function(w) hasLower(w),
    inputs = c("abc", "9893", "0123457", "HDIENNELLS", "abCdeFgh", "a_90hdSi24D"),
    expected = c(T, F, F, F, T, T)
)

numTests <- list(
    message = "hasNum",
    funct = function(w) hasNum(w),
    inputs = c("abc", "9893", "0123457", "HDIENNELLS", "abCdeFgh", "a_90hdSi24D"),
    expected = c(F, T, T, F, F, T)
)

punctTests <- list(
    message = "hasPunct",
    funct = function(w) hasPunct(w),
    inputs = c("abc", "9893", "012#457", "HDIENNELLS", "abCdeFgh", "a_90hdSi24D"),
    expected = c(F, F, T, F, F, T)
)

passwordTests <- list(
    message = "validPassword",
    funct = function(w) validPassword(w),
    inputs = c("abc", "9893", "012#457", "HDIENNELLS", "abCdeFgh", "a_90hdSi24D"),
    expected = c(F, F, F, F, F, T)
)

# ========= TESTS for Email ============= #

emailTests <- list(
    message = "validEmail",
    funct = function(w) validEmail(w),
    inputs = c("aechevarria@hmc.edu", "lanalove420@gmail.com", "12skipafew100@yahoo.net",
    "_alex.echevarria95_@gmail.com", "_alex.echevarria@95_@GMAIL.com", "goHawks.gmail.com",
    "no-reply@greenhouse.io", "aechevarria@hmc.edu@sluts.now" 
     ),
     expected = c(T, T, T, T, F, F, F, F)
)

# ========= TESTS for Username ============= #

usernameTests <- list(
    message = "validUsername",
    funct = function(w) validUsername(w),
    inputs = c("a7eiie7a", "ie*88", "^4209696", "8$eiie", "&iie3", "&ie88^88"),
    expected = c(F, T, F, F, T, T)
)


# Executing the tests
tests <- list(
    vpTests = list(lengthTests, upperTests, lowerTests, numTests, punctTests, passwordTests),
    eTests = list(emailTests),
    uTests = list(usernameTests)
)


for( testSuite in tests){
    runTests(testSuite)
    cat("\n")
}

