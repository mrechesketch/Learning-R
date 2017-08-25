# courtesy of http://adv-r.had.co.nz/OO-essentials.html
# Node Class definition
MyNode <- setRefClass("MyNode",
  fields = list(data = "ANY", nxt = "ANY"))

# MyList defintion
LinkedList <- setRefClass("LinkedList",
    fields = list(head = "ANY", size = "numeric"),
    methods = list(
        
        addNode = function(node) {
            if (is.null(head)){
                head <<- node
            }
            else{
                node$nxt <- head
                head <<- node
            }
            size <<- size + 1
        },

        add = function(datum) {
            node <- MyNode$new(data = datum, nxt = head)
            addNode(node)
        },

        append = function(otherLinkedList) {
            node <- head
            while(!is.null(node$nxt)){
                node <- node$nxt
            }
            node$nxt <- otherLinkedList$head
            size <<- size + otherLinkedList$size
        },

        pop = function(){
            node <- head
            head <<- head$nxt
            size <<- size - 1
            node$nxt <- NULL
            return(node)
        }        
    ))



first <- MyNode$new(data = 4, nxt = NULL)
second <- MyNode$new(data = 88, nxt = first)
MyList <- LinkedList$new(head = second, size = 2)
third <- MyNode$new(data = 0, nxt = NULL)
MyList$addNode(third)

fourth <- MyNode$new(data = 33, nxt = NULL)
fifth <- MyNode$new(data = 32, nxt = fourth)
OtherLinked <- LinkedList$new(head = fifth, size = 2)
MyList$append(OtherLinked)



# a <- MyNode$new(data = 100, nxt = NULL)
# b <- MyNode$new(data = 0, nxt = a)