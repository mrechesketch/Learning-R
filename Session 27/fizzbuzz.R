
# we've done this problem before
# print the numbers between 1 - 100
# if the num is divisible by 3 print "Fizz"
# if the num is divisible by 5 print "Buzz"
# if both, print "FizzBuzz"
# otherwise print the number

FizzBuzz <- function(){
    for(i in 1:100){
        printable <- ""
        if( i %% 3 == 0){
            printable <- paste0(printable, "Fizz")
        }
        if( i %% 5 == 0){
            printable <- paste0(printable, "Buzz")
        }
        if( printable == ""){
            printable <- paste0(printable, i)
        }
        print(printable)
    }
}


