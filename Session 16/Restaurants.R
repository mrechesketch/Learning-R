library(ggplot2)
#loading library time
fileName <- "Restaurant_Inspection_Scores.csv"

rdf <- read.csv(fileName)
#loading up data set

rdf$Inspection.Date <- as.Date(rdf$Inspection.Date, "%m/%d/%Y")

tacoBell <- subset(rdf, Restaurant.Name == "Taco Bell")
#make it so we are only looking at restaurants called "Taco Bell"

tacoPlot <- ggplot( TacoBell, aes(Inspection.Date, Score)) +geom_line()
#graphing tabo bells scores through time

geogPlot <- ggplot( rdf, aes ( Zip.Code, Score )) +geom_boxplot()
#graphing scores and averages by zipcode

gradeDate <- subset(rdf, Inspection.Date>as.Date("01.01.2017", "%m.%d.%Y"))
#filtering data so we only get scores from 2017

newGeoPlot <- ggplot( gradeDate, aes ( Zip.Code, Score )) +geom_boxplot()
#scores and averages by zip, only from 2017

