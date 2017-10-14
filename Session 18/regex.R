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
hasLength <- function(password) nchar(password) >= 8

hasUpper <- function(password) grepl("[A-Z]", password)

hasLower <- function(password) grepl("[a-z]", password)

hasNum <- function(password) grepl("[0-9]", password)

# might have to resort to POSIX style here
hasPunct <- function(password) grepl("[[:punct:]]", password)

validPassword <- function(p){
    hasLength(p) && hasUpper(p) && hasLower(p) && hasNum(p) && hasPunct(p)
}


# ======================= PART II: EMAILS ======================== #q

# what do emails look like anyway?
#   ex 1: aechevarria@hmc.edu
#   ex 2: lanalove420@gmail.com
#   ex 3: 12skipafew100@yahoo.net

# so lets look at the common elements:
    # all have ONE @ symbol
    # the @ symbol is preceeded by alphanumeric with intermittent *punctuation* 
    #   *punctuation* (only . - _ is acceptable) and you can't end on it 
    # the @ symbol is followed by only alphabetical characters 
    # until the "."
    # and lastly we have some valid extensions: com, edu, net etc..

# lets keep it simple and just follow the above rules
# wikipedia has an article on email addresses: https://en.wikipedia.org/wiki/Email_address
# they don't necessarily have to follow the same rules as above
# but the wiki definition of email looks trick 

# hence the above example emails are all valid

# however 
#   _alex.echevarria95_@gmail.com would not be because there is beginning & ending punctuation 
#   goHawks.gmail.com is missing the @ symbol
#   no-reply@greenhouse.io does not have the correct extension

# let develop our patterns that will detect some of these things

# lets start with an easy example



# now it's your turn to try
alphaNumPattern <- "\\w"
isAlphaNum <- function(string) grepl(alphaNumPattern, string)

alphaNumTests <- list(
    message = "isAlphaNum",
    inputs = c("aaaa", "a883kd", "554-!3d"),
    expected = c(T, T, F)
)



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





# Executing the tests
vpTests <- list(lengthTests, upperTests, lowerTests, numTests, punctTests, passwordTests)

runTests(vpTests)
