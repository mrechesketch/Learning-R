predictionResults <- "used_cars-results.csv"

data <- read.csv(predictionResults)

data$treeError <- data$actualPrice - data$TreeModel

TE <- data$treeError 

data$MatrixError <- data$actualPrice - data$MatrixModel

ME <- data$MatrixError

