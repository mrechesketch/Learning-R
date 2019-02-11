ok <- list(
    hello = 4,
    goodbye = "abc"
)

better <- new.env( parent = emptyenv() )
assign("what", TRUE, envir = better)
assign("maybe", 69, envir = better)

# if we want to save the whole pickle, use save.image
save.image("myshit.RData") # this is the same as saying yes when you quit

# if we want to just save a little piece...
save(ok, file = "ok.RData")
save(better, file = "better.RData")

# and now to retrieve your goodies
load("better.RData") # loads variables into parent environment

# for more percision
load("ok.RData", envir = better)