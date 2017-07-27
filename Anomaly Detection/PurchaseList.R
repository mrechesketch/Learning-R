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
    amount = "numeric", amountsq = "numeric",
    nxt = "ANY", prev = "ANY"))

# Puchase constructor is a function that returns a ref object
Purchase <- function(ID, amount){
    newPurchase <- Purchase_$new(purchaser = ID, amount = amount, 
    amountsq = amount**2, nxt = NULL, prev = NULL)
    return(newPurchase)
}

PurchaseList_ <- setRefClass("PurchaseList_",
    
    fields = list(tracked = "numeric", 
    tail = "Purchase_", Tth = "Purchase_", head = "Purchase_",
    len = "numeric", sum = "numeric", sqsum = "numeric"),

    methods = list(

        # with add we can assume we have len of at least 1
        add = function(purchase){
            # update member variables
            len <<- len + 1
            sum <<- sum + purchase$amount
            sqsum <<- sqsum + purchase$amountsq
        },

        remove = function(purchaserID){
            # this one is tricky!
        },

        calcMean = function(){
            return(sum/len)
        },

        calcStd = function(){
            avg <- calcMean()
            return(0)
        },

    # ========================================== #
    # ========== HELPER METHODS ================ #
    # ========================================== #
        # moves T pointer towards head
        # use in add
        Tup = function(){
            # subtract out old data
            sum <<- sum - Tth$amount
            sqsum <<- sqsum - Tth$amountsq
            # move it toward head
            Tth <<- Tth$nxt
            # add in new data 
            sum <<- sum + Tth$amount
            sqsum <<- sqsum + Tth$amountsq
        },

        # moves T pointer towards tail
        # use in remove
        Tdown = function(){
            # TODO
        }

        
    )
)

# PurchaseList constructor is a function that returns a ref object
PurchaseList <- function(T, purchase){
    newPL <- PurchaseList_$new(tracked = T,
    tail = purchase, Tth = purchase, head = purchase,
    len = 1, sum = purchase$amount, sqsum = purchase$amountsq)
    return(newPL)
}




