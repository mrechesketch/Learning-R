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
            # add a piece of data to the list
            print("TODO")
        },

        append = function(otherLinkedList) {
            # append two linked lists
            # parameter should go on end
            print("TODO")

        }

    ))



first <- MyNode$new(data = 4, nxt = NULL)
second <- MyNode$new(data = 88, nxt = first)
MyList <- LinkedList$new(head = second, size = 2)
third <- MyNode$new(data = 0, nxt = NULL)
MyList$addNode(third)



# a <- MyNode$new(data = 100, nxt = NULL)
# b <- MyNode$new(data = 0, nxt = a)