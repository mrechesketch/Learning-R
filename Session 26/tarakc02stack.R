peak <- function(s) UseMethod("peak")
push <- function(s, new_item) UseMethod("push")
without_top <- function(s) UseMethod("without_top")
size <- function(s) UseMethod("size")


print.stack <- function(s) {
    cat("A stack of size", size(s))
    if (size(s) > 0L) {
        cat("\nTop:\n") 
        str(peak(s))
    }
    invisible(s)
}

# an empty stack should just be a function that returns the expected values
stack <- function() {
    f <- function(query) 
        switch(query, 
               peak = NULL,
               without_top = stop("Stack is already empty", call. = FALSE),
               size = 0L)
    structure(f, class = "stack")
}

peak.stack <- function(s) s("peak")
without_top.stack <- function(s) s("without_top")
size.stack <- function(s) s("size")


push.stack <- function(s, new_item) {
    sz <- size(s) + 1L
    f <- function(query) 
        switch(query,
               peak = new_item,
               without_top = s,
               size = sz)
    structure(f, class = "stack")
}