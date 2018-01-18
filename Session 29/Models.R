source("dataTreatment.R")


f1 <- "used_cars-small.csv"
f2 <- "used_cars-test-dirty.csv"
training.set <- "used_cars-train.csv"
test.set <- "used_cars-test.csv"
answers <- "used_cars-results.csv"

Model <- setRefClass(
            Class = "Model",

            fields = list(
                model = "matrix",
                dists = "numeric",
                means = "numeric",
                observable = "character",
                # left null
                fit = "ANY",
                predictions = "numeric"
            ),

            methods = list(

                initialize = function(filename = training.set, obs = "price"){
                    # extract
                    scrubbed <- cleanData(filename)
                    transformed <- transformData(scrubbed)
                    # create min-max matrix
                    minMaxMatrix <- apply(transformed, 2, function(x) c( min(x), max(x) ))
                    rownames(minMaxMatrix) <- c("min", "max")
                    # assign member variables
                    means <<- apply(minMaxMatrix, 2, function(x) (x["max"] + x["min"])/2 )
                    dists <<- apply(minMaxMatrix, 2, function(x) (x["max"] - x["min"])/2 )
                    model <<- mapply( function(dm, avg, ds) (dm-avg)/ds, transformed, means, dists)
                    observable <<- obs
                    # repeat{
                    #     print( colnames(model) )
                    #     observable <<- readline(prompt = "Choose one to model, (no quotes): ")
                    #     if( any(colnames(model) == observable) ) break else print("invalid, try again")
                    # }
                    print("Model is ready to build") # goodbye message                    
                },

                show = function() print( head(model) )
            )
)

TreeModel <- setRefClass(
                Class = "TreeModel",
                contains = "Model",
                methods = list(

                    load = function(){
                        library(rpart)
                        form <- paste(observable, "~.")
                        fit <<- rpart( formula = form, data = data.frame(model) )
                        print("Tree Model loaded")
                    },

                    execute = function(testSet = test.set){
                        ts <- read.csv(testSet) # read in
                        ts <- transformData(ts) # transform to numerics
                        ts <- mapply( function(dm, avg, ds) (dm-avg)/ds, ts, means, dists) # encode
                        values <- predict(fit, data.frame(ts), type = "vector")
                        predictions <<- (values * dists[observable]) + means[observable]
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
           y <- model[,observable]
           colsToKeep <- !colnames(model) == observable
           # , is because the first subest is rows, second is columns 
           X <- model[,colsToKeep] 
           X.T <- t(X) 
           #from https://en.wikipedia.org/wiki/Linear_least_squares_(mathematics)#R_(programming_language)
           fit <<- solve(X.T %*% X) %*% X.T %*% y 
           print("Matrix Model loaded")
        },

        execute = function(testSet = test.set){
            ts <- read.csv(testSet) # read in
            ts <- transformData(ts) # transform to numerics
            ts <- mapply( function(dm, avg, ds) (dm-avg)/ds, ts, means, dists) # encode
            colsToKeep <- !colnames(ts) == observable
            ts <- ts[,colsToKeep] 
            values <- apply(ts, 1, function(r) r %*% fit )
            predictions <<- (values * dists[observable]) + means[observable]
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

tm <- MatrixModel()
tm$load()
tm$execute()
tm$write()