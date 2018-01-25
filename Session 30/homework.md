I'm am sorry for the delay! I swear I have been working! I was cleaning up Model.R (still needs work) and working on making an ASCII game on snake (still unclear if it will this dream will come true..)

1. (PROBLEM STATEMENT) In Hadley Wickam's Advanced R: "The S3 object system," he mentions at the end of the chapter: "When implementing a vector class, you should implement these methods: length, [, [<-, [[, [[<-, c. (If [ is implemented rev, head, and tail should all work)." (http://adv-r.had.co.nz/S3.html) We mostly deal with ref classes and have never really used the S3 system. However, ref classes can still have S3 style methods (wow!). This is related to the really confusing functional programming stack we looked at by tarakc02 in Session 26. It's the whole function-name.class-name business. Last time, I showed you how to implement "[" using setMethod. This time, you are going to implement "[", "[<-", length AND rev for the v class. DO THIS IN THE SESSION 28 FOLDER. You may notice I copied the v class file into Session 30 to use it for Snake, no peeking!!. 
    i. Ok you can peek a little bit at Session 30 but only if you are super lost!
    ii. You might want to implement $getItem and $setItem for the v class before implementing "[" and "[<-". Square bracket access and assignment are known as "syntactic sugar" and are really just wrappers for kinda ugly member functions like $getItem or $setItem. 
    iii. I showed you setMethod in Session 28. Try using `[.v`, `[<-.v`, rev.v, length.v instead as the function names. You may have to spend considerable time researching and reading to wrap your head around the kooky R syntax before you start.
    iv. The ` mark is not the single quote '. This character is found next to 1 on the keyboard btw.

To navigate to Session 28 from the Learning-R directory, cd Sessi tab to complete to Session\ then type 28, hit enter. You should be in the Session 28 directory. Begin R. Source("v.R") 

2. INTERACTIVE MODE OBJECTIVE "[" : See how a normal array act and model your "[" after that (i.e. when you index to outside of the array, what should you get?) 

3. INTERACTIVE MODE OBJECTIVE "[<-" : This one is tricky. Remeber you are returning an object of class v, not an array. You should also think about what happens when you assign an index greater than size or greater than capacity (do they need to change?)

4. INTERACTIVE MODE OBJECTIVE length : before you implement length.v, try running seq_along(pro). What do you get? After you implement length.v, what does seq_along(pro) return? Comment out length, source("v.R") and run seq_along(pro) one more time. Did you get what you expected?    

5. INTERACTIVE MODE OBJECTIVE rev : Similar to #3, rev should return an object of class v, not just the reversed array. 
   