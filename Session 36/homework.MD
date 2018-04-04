## PROBLEM 1: Finish constructPath function

Last time we left off, we were trying to make a constructPath function that could leverage euclidean geometry rather an a taxi-cab geometry. The dream to this problem is to paste0 two vectors together of equal length but with the appropriate number of instruction blocks. For example, if we were moving 4 units N and 3 units E, our paste call would look something like this:

    lat <- c("E", "E", "E", "")
    lon <- c("N", "N", "N", "N")
    pasted <- paste0(lon, lat)
    ## pasted == c("NE", "NE", "NE", "N")

The trick here is to get two vectors of equal length (what is the appropriate length?) and then only fill in the needed number of direction blocks. For example...

    lat <- c("", "", "", "")
    # something happens...
    lat <- c("E", "E", "E", "")

I left you comments and hints in the contructPath function. You will need to write **3** lines of new code and make fixes **2** lines. All lines are clearly marked and you don't need to deviate from that order. 

P.S. For this function let us assume we are never moving only North-South or only East-West (that could mess it up..) 

## PROBLEM 2: In-Session Assignment: Control Charts

In an effort not to fall down the __deep__ hole that is image processing, we are not going to get into videos. Instead we're going to develop some control charts. 

Let's pretend you are a teacher of a class and you give all the students a test with some questions on it. All questions are worth 10 points. You have designed the class and the test so that students who are doing well and not cheating should average about an 80% on the test. Students with above a 95% average are probably cheating and students with lower than a 65% average are failing =/. I want a   