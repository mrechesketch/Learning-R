1. Have you been thinking deeply about how to permute size? Good. I'm sure other people are thinking deeply about the same problem or have done so in the past. Launch a google search to find our problem and how other people solved it! The solution will probably not be in R and will probably use recursion but that is OK. Hint: they won't be calling it "permute size". Find out what other people are calling this problem and include any links you find along the way. If you can translate their (probably python) solutions into R, excellent!

    ANSWER: its called a permutation matrix
    http://mathworld.wolfram.com/PermutationMatrix.html
    partitioning a set


2. Look at the solution in permuteSize.R and answer the following questions. The "what" questions are testing your ability to read the code and can be answered consicely. The "how" or "why" questions are testing your big picture understanding & mathematical intuition and require longer answers. 
    
    ( 2.1 ) What does includeExclude do?

    ANSWER: it is a filter that isolates the desired value from the others in the set and grows the set

        ( 2.2 ) What is the output of includeExclude(1, 1, 1)?

            EXAMPLE ANSWER: list( include = c(1), exlcude = numeric(0), nextSize = 2 )

        ( 2.3 ) What is the output of includeExclude(1, 1:2, 2) and what does it mean to be the "seed"?

            ANSWER: 
            list( include = c(1), exlcude = numeric(2), nextSize = 3 )
            the seed is the starting point for testing a function 

        ( 2.4 ) What is the output of includeExclude(1, 1:3, 3)

            ANSWER: 
            list( include = c(1), exlcude = numeric(2&3), nextSize = 4 )

        ( 2.5 ) What is the output of includeExclude(2, 1:3, 3)

            ANSWER: 
            list( include = c(2), exlcude = numeric(1&3), nextSize = 4 )

        ( 2.6 ) What is the output of includeExclude(3, 1:3, 3)

            ANSWER: 
            list( include = c(3, exlcude = numeric(2&1), nextSize = 4 )

    ( 2.7 ) What is the "trivial case" of partitionSet(vec) and how does it relate to (2.2) and (2.3)?

    ANSWER: the trivial case has one elements, so (2.2) would be a trivial case, where you just return that element. (2.3) is the bare minimum needed to activate the rest of the function

    ( 2.8 ) Why do we allocate (2^len)-1 spaces for our answers? If we allocated 2^len instead what would go into that 1 spot we didn't subtract? (This problem is related to the same reason we use (2.3) as the seed instead of (2.2) ) 

    ANSWER: i don't really know how to describe this, but it has to do with the trivial case, you'd functionally have two of them if you didn't subtract that last space of allocation

    ( 2.9 ) What is the purpose of the "seen" logical array? How does it relate to (2.6)

    ANSWER: 

    ( 2.10 ) What (early) recursive function we went over does includeExclude remind you of? This particular function does not use a bottom-up approach but rather recursively weighs all options of _keeping_ or _discarding_ the first element. How does this relate to your answer for (2.8)?

    ANSWER: change <- function (amount, coins){
    if (length(coins) == 0) {
        return(amount==0)
    }
    useIt = change(amount-coins[1],coins[-1] )
    loseIt = change(amount,coins[-1])
    return(useIt || loseIt)

    in this case the trivial case is at 0, because its recursive 

    ( 2.11 ) What is the stopping condition of includeExclude / partitionSet? By stopping condition I mean the point where we decide the top has been popped and includeExcluded the correct number of times and is ready to be written to results. HINT: your answer should include $nextSize

    ANSWER:    if( top$nextSize > len ){
            # this means it's ready
            results[[i]] <- vec[top$include]; i <- i + 1 # result pair can be written
            results[[i]] <- vec[top$exclude]; i <- i + 1

            when you stop pushing and write into the results 

**SIDE NOTE** I created a new csv called Ticketleap_2017.csv in the Session 21 folder that has all the uneccessary columns removed. This was just to speed up us working on the file during a session so we weren't waiting around for R to read in uneccessary data everytime we sourced the workFile.R. This file was created with the function called writeCleanData(). We can go over this function together.

Do 3 and 4 in workfile.R

3. Finish the _event vs proceeds_ bar graph where the low events have been filtered out. **The plot should be presentable meaning every event name is clearly displayed and not overlapping.**This may mean you have to set a higher threshold for keeping the event  OR you could run a routine that only keeps the top 5 or 10 events (suggested).. 

4. Create a _date vs proceeds_ bar graph using the Ticketleap data where the x-axis is the month and the y is how much $$ in proceeds. The plot should be presentable axes have proper labels with months 
      