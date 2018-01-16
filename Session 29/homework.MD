In this homework we will be implementing a _decision tree_ to predict the price of a used car based off of predictors like mileage (or kilometers in this case), age, if the car has damage, etc.. Remember, the decision tree is the same structure that we used to implement a guessing game. We will also be implementing a super fancy _matrix method_ for prediction!!

This data set was found on Kaggle. I wanted to use a data set I had previously worked with for a coding challenge for gearbox but I didn't save the training set and I can't find it :'(


Cleaning the data will be the main part of your homework. We have completed similar data cleansing/preparatory routines before
I have created a small data set *used_cars-small* for us to use quickly when we are developing methods we don't make
a silly mistake when dealing with the large data set and have R crash on us

1. Load used_cars-small.csv as a data frame

2. Drop all the useless columns. They are not totally useless, they just can't be used in our methods

    Columns to keep: "price", "abtest", "yearOfRegistration", "gearbox", "powerPS", "kilometer", 
                    "monthOfRegistration", "fuelType", "notRepairedDamage", "dateCreated", "lastSeen"

3. Drop all rows with missing data OR 0 as a value. We will consider the 0 as missing data. If you get stuck on this one, move on and work on 4, 5 and 6!

A bit more on our two methods- as you may have guessed, our methods can NOT deal with missing data.. Another thing
to note about our method is that it predicts a _continuous_ variable rather than something discrete like brand or vehicle type.

A few more things:
    i. our method will ONLY take in numbers.. hence all the strings gotta go
    ii. Our methods will only take in numbers between -1 and 1.. wait what?
        Case I: it's a (binary) string!
            "abtest" : test = 1, control = -1
            "gearbox" : manuell = 1, automatik = -1
            "fuelType" : benzin = 1, diesel = -1
            "notRepairedDamage" : ja = 1, nein = -1
        Case: II: it's a number(ish)
            First, turn the dates into meaningful numbers
            
            lastSeen - dateCreated : how long the vehicle was posted
            1.2017 - month.yearOfRegistration : how old the vehicle is
            
            Next, encode all numbers scaled on the [-1,1] basis
            where [min, max] == [-1, 1]

            e.g. if we have vec <- c(0, 2, 6, 8, 12), min = 0 and max = 12
            so our new_vec == c(-1.000, -0.6667,  0.0000,  0.3333,  1.0000)  

4. Write functions to take care of Case I, encode strings as 1 or -1 and return NA as a default

5. Condense the date related columns into two columns: carAge and timeOnMarket

6. Write a function that takes in a vector and encodes it to a new basis of [-1, 1]
            

  