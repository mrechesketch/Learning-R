win <- function() print("I win!")

lose <- function(){
    print("hmmm.. I'm all out of guesses, I guess I lose :(.") 
    ans <- readline( prompt = "I'm curious, what were you thinking about?: ")
    newQ <- readline( prompt = "And what is a question I could ask about this thing?: ")
    
    guess(newQ, guess( paste("Is it a", ans), win, lose ), lose ) 
}

playAgain <- function(){
    again <- readline( prompt = "Would you like to play again? y/n: ")
    again == "y"
}




start <- function(){

    startMessage <- "We're going to play a game where I guess what you are thinking..."
    print(startMessage)

    firstQuestion <- "Are you thinking about a pineapple?"
    firstGuess <- guess(firstQuestion, win, lose )
    wantsToPlay <- TRUE

    while( wantsToPlay ){
        firstGuess()
        wantsToPlay <- playAgain()
    }
    
}

guess <- function(question, yes, no){

    q <- question 
    y <- yes
    n <- no
    
    parent <- environment()
   

    function(){
        
        print(question)
        print("Enclosing environment: ")
        print(parent)
        print("Parent of enclosing environment: ")
        print( parent.env( parent ) )
         
        answer <- readline(prompt="y/n: ")
        answer.isYes <- answer == "y"

        if( answer.isYes ) y() else n <<- n() 
    }
    
}