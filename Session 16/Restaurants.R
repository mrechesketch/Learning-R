library("ggplot2")
#library("ggmap")
library("dplyr")


fileName <- "Restaurant_Inspection_Scores.csv"

rdf <- read.csv(fileName)
#loading up data set

rdf$Inspection.Date <- as.Date(rdf$Inspection.Date, "%m/%d/%Y")

tacoBell <- subset(rdf, Restaurant.Name == "Taco Bell")
#make it so we are only looking at restaurants called "Taco Bell"

tacoPlot <- ggplot( tacoBell, aes(Inspection.Date, Score)) +geom_line()
#graphing tabo bells scores through time

geogPlot <- ggplot( rdf, aes ( Zip.Code, Score )) +geom_boxplot()
#graphing scores and averages by zipcode

gradeDate <- subset(rdf, Inspection.Date>as.Date("01.01.2017", "%m.%d.%Y"))
#filtering data so we only get scores from 2017

rdf$Zip.Code <- as.numeric( rdf$Zip.Code) 
newGeoPlot <- ggplot( gradeDate, aes ( Zip.Code, Score )) +geom_boxplot()
#scores and averages by zip, only from 2017


# Now we're going to seperate the address from the lonigitude & latitude
rdf <- subset(rdf, grepl("\\(.+\\)", Address) ) # we can't operate on a pattern that doesn't exist 
latLonRegExprs <- with(rdf, regexpr("\\(.+\\)", Address, perl=TRUE) ) # getting start positions and length
matchStrings <- with(rdf, regmatches(Address, latLonRegExprs) ) # string looks like: "(30.312799, -97.662825)"

# split and clean the string
latLonStr <- strsplit(matchStrings, ", ") # split it on the coordinates
rdf$lats <- sapply(latLonStr, function(x) as.numeric(sub("\\(", "", x[1])) ) # take out parentheses 
rdf$lons <- sapply(latLonStr, function(x) as.numeric(sub("\\)", "", x[2])) ) # and convert to numeric

#austin <- qmplot(lons, lats, data = rdf, maptype = "toner-lite", color = I("red"))


