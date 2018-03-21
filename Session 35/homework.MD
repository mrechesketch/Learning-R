
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

ignore this.. feel free to browse the other files in the directory. I was kinda just thinking out loud

# PROBLEM 3: Bar Plots.. polar.R

These seem pretty straight forward right ;)? I left you all the requisite ingredients you need to create similar plots. You don't need to make any calls to melt.. Simply try to imitate the plots I have created. You may need a transformation into polar coordinates.. The plots you create **must have coloring by category** (or player depending on your x axis) and they must display the _data in ascending order_. 
    

