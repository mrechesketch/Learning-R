Questions
1. What are the advantages of using a closure vs a reference class? 
Closure can decrease the amount of code needed, because unlike reference class, you can use closure to impact functions. It allows you to fix a mistake once, instead of all over the code you've written. This is because you are changing a 'daddy' environment that your funcitons exist in. 


2. When we load the dictionary, how will we associate the word with it's conjugate LetterBag?
total word score, leng of word, average value of letter

3.  Write some sudo-code for loading a dictionary *line by line* (peek at the printLines_2 function of Session 10/jsonToPurchases)
printLines_2 <- function(filepath) {
  con <- file(filepath, "r")
  on.exit(close(con))
  while ( TRUE ) {
    line <- readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    print(line)
  }
}
Other Thots...


[your thots here]