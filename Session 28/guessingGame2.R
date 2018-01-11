


     

playAgain <- function(){
    again <- readline( prompt = "Would you like to play again? y/n: ")
    again == "y"
}




start <- function(){

    print("Let's play a guessing game!") # friendly start message
    firstQuestion <- "Are you thinking about a pineapple?" # default first question
    game <- guess(firstQuestion, NULL, NULL) # create the game

    repeat{
        game() # start game
        playsAgain <- readline( prompt = "Would you like to play again? y/n: ")
        if( !(playsAgain == "y") ) break # exit if not yes
    }

    print("Goodbye!") # say goodbye
    
}

guess <- function(question, yes, no){

    q <- question 
    y <- yes
    n <- no

    win <- function() print("I win!")

    learn <- function(){
        print("hmmm.. I'm all out of guesses, I guess I lose :(.")
        ans <- readline( prompt = "I'm curious, what were you thinking about?: ")
        newQ <- readline( prompt = "And what is a question I could ask about this thing?: ")
        n <<- guess(newQ, guess( paste("Is it a", ans), NULL, NULL), NULL)
    }
    
   
   
    # return the function which reads the question and makes
    # decision about where to move next
    function(){
        
        print(question) # ask the question
        answer <- readline(prompt="y/n: ")
        answer.isYes <- answer == "y"

        yOrN <- if( answer.isYes ) y else n

        if( !is.null(yOrN) ) return( yOrN() )
        
        if( answer.isYes ) win() else learn()

    }
    
}