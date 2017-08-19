fzzBzz <-function(){
    for(i in 1:100){
        if(i %% 3 == 0){
            print("Fizz")
           
            }
        if(i %% 5 == 0){
            print("Buzz")
        }
        if(i %% 3 == 0 && i %% 5 == 0){
            print("FizzBuzz")
       }
       if(!(i %% 3 == 0 || i %% 5 == 0)){
           print(i)
       }
    }
}

