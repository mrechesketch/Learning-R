
Model <- setRefClass(
            Class = "Model",

            fields = list(
                designMatrix = "matrix",
                testMatrix = "matrix",
                observable = "ANY",
                # left null
                model = "ANY",
                predictions = "numeric"
            ),

            methods = list(

                initialize = function(train, test, predict){
                    # separate the observable from the training
                    observable <<- train[predict] 
                    train <- train[!names(train) == predict]
                    # separate the ?observable from the testing
                    if( any( names(test) == predict ) ){
                        test <- test[!names(test) == predict]
                    }
                    # create mins & maxes
                    mins <- apply(train, 2, min)
                    maxes <- apply(train, 2, max)
                    # assign member variables
                    designMatrix <<- encode(train, avg = (mins+maxes)/2, span = (maxes-mins)/2)
                    testMatrix <<- encode(test, avg = (mins+maxes)/2, span = (maxes-mins)/2)
                    print("Model is ready to build") # goodbye message                    
                },

                show = function() print( class(.self)[1] ), # print class name,

            # scales and translates a matrix to a [-1, 1] basis and adds column of ones
                encode = function(dataframe, avg, span){
                    ones <- rep(1L, nrow(dataframe)) 
                    scale( x = cbind(ones, dataframe), # add in column of 1's
                    center = c(0,avg), scale = c(1,span) ) # set center and scale appropriately
                }

            
            )
)

TreeModel <- setRefClass(
                Class = "TreeModel",
                contains = "Model",
                methods = list(

                    load = function(){
                        library(rpart)
                        form <- paste(names(observable), "~.")
                        model <<- rpart( formula = form, data = data.frame(observable, designMatrix) )
                        print("Tree Model loaded")
                    },

                    execute = function(){
                        predictions <<- predict(model, data.frame(testMatrix), type = "vector")
                        print("Tree Model executed") 
                    },

                    write = function(resultFileName = answers){
                        results <- read.csv(resultFileName)
                        results$TreeModel <- as.integer(predictions)
                        write.csv(results, resultFileName, row.names = F)
                        print("Tree Model results written")
                    }


                )

)

#matrix method

MatrixModel <- setRefClass(
    Class = "MatrixModel",
    contains = "Model",
    methods = list(

        load = function(){
           y <- observable[[names(observable)]] # coerce to vector
           X <- designMatrix
           X.T <- t(X) 
           #from https://en.wikipedia.org/wiki/Linear_least_squares_(mathematics)#R_(programming_language)
           model <<- solve(X.T %*% X) %*% X.T %*% y 
           print("Matrix Model loaded")
        },

        execute = function(){
            predictions <<- apply(testMatrix, 1, function(r) r %*% model ) # dot product!
            print("Matrix Model executed") 
        },

         write = function(resultFileName = answers){
            results <- read.csv(resultFileName)
            results$MatrixModel <- as.integer(predictions)
            write.csv(results, resultFileName, row.names = F)
            print("Tree Model results written")
}
    
    )
)

# lets test the models on some data
source("dataTreatment.R")

# train data
f1 <- "used_cars-small.csv"
f2 <- "used_cars-test-dirty.csv"
train.set <- "used_cars-train.csv"
test.set <- "used_cars-test.csv"
answers <- "used_cars-results.csv"


# prepare data 
training <- transformData(cleanData(train.set))
testing <- transformData(read.csv(test.set))


tm <- TreeModel(train = training, test = testing, predict = "price")
tm$load()
tm$execute()
tm$write()

mm <- MatrixModel(train = training, test = testing, predict = "price")
mm$load()
mm$execute()
mm$write()