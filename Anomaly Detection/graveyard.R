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
    tail = "ANY", Tth = "ANY", head = "ANY",
    len = "numeric", sum = "numeric", sqsum = "numeric"),

    methods = list(

        # with add we can assume we could have a len of 0
        add = function(purchase){
            # first step: create pnode_
            pnode_ <- Pnode(purchase)
            # check if list is empty
            if (len == 0){
                tail <<- pnode_
                Tth <<- pnode_
                head <<- pnode_
            }
            #otherwise link existing Pnodes 
            else{
                pnode_$prev <- head
                head$nxt <<- pnode_
                head <<-pnode_
            }
            #check if we need to Tup
            if(len>=tracked){
                Tup()
            }
            # update member variables
            len <<- len + 1
            sum <<- sum + purchase$amount
            sqsum <<- sqsum + purchase$amountsq
        },

        remove = function(purchaserID){
            # we're going to loop through this list backards [WHY?]
            start <- head
            while(start != NULL){
                # check if you should delete
                isDelete <- (purchaserID == start$getID)
                if(isDelete){
                    len <<- len - 1
                    sum <<- sum - start$getAmount
                    sqsum <<- sqsum - start$amountsq
                    if (len>Tth){
                        Tdown()
                    }
                    deletenode(start)
                }






                # advance start to head
                start <- start$prev

            }


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
        deletenode = function(node){
            isHead <- (node$nxt == NULL)
            isTail <- (node$prev == NULL)
            isOnly <- (isHead && isTail)
            isBody <- !(isHead || isTail)
            #$$ both must be true
            #|| either statement must be true
            if(isOnly){
                head <<- NULL
                tail <<- NULL
                Tth <<- NULL
            }
            if(isHead){
                head <<- node$nxt
                node$nxt$prev <- NULL
                node$nxt <- NULL
            }
            if(isTail){
                # case where T and tail are  same
                if(Tth == tail){
                    Tth <<- node$prev
                }
                tail <<- node$prev
                node$prev$nxt <- NULL
                node$prev <- NULL     
            }
            if(isBody){
                node$prev$nxt <- node$nxt
                node$nxt$prev <- node$prev
                node$nxt <- NULL
                node$prev <- NULL
            }
            rm(node) 
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


addPointerTests <- function(){
    PL <- PurchaseList(T, pen)
    # test constructor
    stopifnot(identical(PL$head$purchase, pen))
    stopifnot(identical(PL$tail$purchase, pen))
    stopifnot(identical(PL$Tth$purchase, pen))
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(identical(PL$head$purchase, car))
    stopifnot(identical(PL$tail$purchase, pen))
    stopifnot(identical(PL$Tth$purchase, pen))
    # add third item
    PL$add(disc)
    stopifnot(identical(PL$head$purchase, disc))
    stopifnot(identical(PL$tail$purchase, pen))
    stopifnot(identical(PL$Tth$purchase, book))
}

addLenTest <- function(){
    PL <- PurchaseList(T, pen)
    stopifnot(PL$len == 1)
    # add two more items
    PL$add(book)
    PL$add(car)
    stopifnot(PL$len == 3)
}

