# this problem is based off HomeAway's (Expedia?? I don't really know tbh) coding challenge 
# there was 75 minutes to complete two problems. This was problem 1


# We are given a sentence and we are supposed to rearrange the words such that

# 1) the sentence begins with a capital letter
# 2) the sentence ends with a period 
# 3) smaller lengths go to the left

# the first two conditions are usually met in a sentence anyway but we'll need to watch out for them

# example:
# input: "The lines are printed in reverse order" 
# output: "In the are lines order printed reverse."

decapitalize <- function(word) word # https://stat.ethz.ch/R-manual/R-devel/library/base/html/chartr.html

removePeriod <- function(word) word # sub & gsub are powerful http://rfunction.com/archives/2354

capitalize <- function(word) word # this one might require more than one line

addPeriod <- function(word) word 

arrange <- function(sentence){

    # tokenize sentence (trust me.. it's easier when the words are in a vector)
    tokens <- strsplit(sentence, " ")[[1]]

    # lowercase first letter of first word

    # remove period 

    # arrange by length

    # capitalize first word

    # add period

    # joing them all together
    sentence <- paste(tokens, collapse = " ")

    return(sentence)
}



decapTests <- list(
    message = "decapitalize",
    funct = function(w) decapitalize(w),
    inputs = c("The", "I", "Here"),
    expected = c("the", "i", "here")
)

rpTests <- list(
    message = "removePeriod",
    funct = function(w) removePeriod(w),
    inputs = c("order.", "code.", "come."),
    expected = c("order", "code", "come")
)

capTests <- list(
    message = "capitalize",
    funct = function(w) capitalize(w),
    inputs = c("in", "i", "mr"),
    expected = c("In", "I", "Mr")
)

apTests <- list(
    message = "addPeriod",
    funct = function(w) addPeriod(w),
    inputs = c("reverse", "code", "come"),
    expected = c("reverse.", "code.", "come.")
)

arrangeTests <- list(
    message = "arrange",
    funct = function(s) arrange(s),
    inputs = c("The lines are printed in reverse order.",
                "I love to code.",
                "Here i come." ),
    expected = c('In the are lines order printed reverse.',
                "I to love code.",
                "I here come." )
)

tests <- list( decapTests, rpTests, capTests, apTests, arrangeTests)

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