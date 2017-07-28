# based off of https://github.com/InsightDataScience/anomaly_detection/blob/master/README.md
# Our purchase list will perform the duties of a users tracked purchases

# the PurchaseList class can promise these things:
    # + deliver mean and standard deviation in O(1) (constant)
    # + can add purchases in O(1) (constant)
    # + removes purchases by purchaser in O(n) (linear)

# PurchaseList has these complexities:
    # - bounded by the parameter T: only last T purchases need by tracked
    # - doubly linked list : queue-like

Purchase_ <- setRefClass("Purchase_",

    fields = list(purchaser = "character", 
    amount = "numeric", amountsq = "numeric"))

# Puchase constructor is a function that returns a ref object
Purchase <- function(ID, amount){
    newPurchase <- Purchase_$new(purchaser = ID, amount = amount, 
    amountsq = amount**2)
    return(newPurchase)
}


Pnode_ <- setRefClass("Pnode_",

    fields = list(purchase = "Purchase_", nxt = "ANY", prev = "ANY"),
    methods = list(
        getAmount = function(){
            return(purchase$amount)
        },
        getID = function(){
            return(purchase$purchaser)
        },
        getSq = function(){
            return(purchase$amountsq)
        }
    )
    )

Pnode <- function(purchase){
    newPnode <- Pnode_$new(purchase = purchase, nxt = NULL, prev = NULL)
    return(newPnode)
}



PurchaseList_ <- setRefClass("PurchaseList_",
    
    fields = list(tracked = "numeric", 
    tail = "Pnode_", Tth = "Pnode_", head = "Pnode_",
    len = "numeric", sum = "numeric", sqsum = "numeric"),

    methods = list(

        # with add we can assume we have len of at least 1
        add = function(purchase){
            #check if we need to Tup
            if(len>=tracked){
                Tup()
            }
            # update member variables
            len <<- len + 1
            sum <<- sum + purchase$amount
            sqsum <<- sqsum + purchase$amountsq
            #deal with Pnode pointers
            pnode_ <- Pnode(purchase)
            pnode_$prev <- head
            head$nxt <<- pnode_
            head <<-pnode_
        },

        remove = function(purchaserID){
            # this one is tricky!

        },

        calcMean = function(){
            return(sum/len)
        },

        calcStd = function(){
            avg <- calcMean()
            return((sqsum/len-avg**2)**0.5)
        },

    # ========================================== #
    # ========== HELPER METHODS ================ #
    # ========================================== #
        # moves T pointer towards head
        # use in add
        Tup = function(){
            # subtract out old data
            sum <<- sum - Tth$getAmount()
            sqsum <<- sqsum - Tth$getSq()
            # move it toward head
            Tth <<- Tth$nxt

        },

        # moves T pointer towards tail
        # use in remove
        Tdown = function(){
            Tth <<- Tth$prev
            sum <<- sum + Tth$getAmount()
            sqsum <<- sqsum + Tth$getSq()
            # move it toward head
            
            # TODO
        }

        
    )
)

# PurchaseList constructor is a function that returns a ref object
PurchaseList <- function(T, purchase){
    pnode_ <- Pnode(purchase)
    newPL <- PurchaseList_$new(tracked = T,
    tail = pnode_, Tth = pnode_, head = pnode_,
    len = 1, sum = purchase$amount, sqsum = purchase$amountsq)
    return(newPL)
}




