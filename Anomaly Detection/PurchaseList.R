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

    fields = list(
        
        purchaser = "character", 
        amount = "numeric", 
        amountsq = "numeric",
        timestamp = "ANY"),
    
    methods = list(

        getAmount = function(){
            return(amount)
        },

        getAmountSq = function(){
            return(amountsq)
        }
    ))

# Puchase constructor is a function that returns a ref object
Purchase <- function(ID, amount, timestamp){
    newPurchase <- Purchase_$new(purchaser = ID, amount = amount, 
    amountsq = amount**2, timestamp = timestamp)
    return(newPurchase)
}

PurchaseList_ <- setRefClass("PurchaseList_",
    
    fields = list(
        
        tracked = "numeric", 
        purchases = "list",
        size = "numeric", 
        sum = "numeric", 
        sqsum = "numeric"),

    methods = list(

        # with add we can assume we could have a len of 0
        add = function(purchase){
            # check if you need to rewrite
            current <- purchases[[ (size %% tracked) + 1 ]]
            if( !is.null(current) ){
                sum <<- sum - current$getAmount()
                sqsum <<- sqsum - current$getAmountSq()
            }
            # put into purchases
            purchases[[ (size %% tracked) + 1 ]] <<- purchase
            # update member variables
            size <<- size + 1
            sum <<- sum + purchase$getAmount()
            sqsum <<- sqsum + purchase$getAmountSq()
        },

        # there is no remove functionality lol

        calcMean = function(){
            return(sum/size)
        },

        calcStd = function(){
            avg <- calcMean()
            return((sqsum/size-avg**2)**0.5)
        }

    
    )
)

# PurchaseList constructor is a function that returns a ref object
PurchaseList <- function(T){
    newPL <- PurchaseList_$new(tracked = T,
    purchases = vector("list", T), size = 0, 
    sum = 0, sqsum = 0)
    return(newPL)
}




