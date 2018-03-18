
## PROBLEM 0: Geting Started

    cd Session\ 35
    r
    #### r starts ####
    install.packages("keypress")


## PROBLEM 1: Interpretter Based Learning

For this exercise you are going to learn how to learn more about library using only the R interpretter. 

    library("keypress")

Libraries are held as environments further up the parent frame from the ".GloablEnv". See for yourself.

    search()

Search() returns the names of all the parents environments in order. How do you check the contents of an environment?

    ls("package:kepress")

What are the contents of the kepress library? Try typing them into the interpretter to see what they are.
(HINT: they are functions)

    # Print both 
    has_kepress_support
    keypress
    # Run both
    has_keypress_support()
    keypress()

# PROBLEM 2: Closure Counter

I have created a function whose 
    

