source("dataTreatment.R")

filename <- "used_cars-test-dirty.csv"
df <- cleanData(filename)


# now write the test and it's answers for validation
testSet <- "used_cars-test.csv"
answerKey <- "used_cars-results.csv"

actualPrice <- df$price
#df <- subset(df, select = -c(price) )

write.csv(df, testSet, row.names=F) # write the test set
write.csv(data.frame(actualPrice), answerKey, row.names=F) # and write the answers 