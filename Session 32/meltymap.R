library(reshape2)
library(ggplot2)
vecs <- list(
    "sins" = sin(1:100),
    "tans" = tan(1:100),
    "rands" = runif(100)
)

mats <- lapply(vecs, function(v) matrix(v, nrow = 10, ncol = 10) )

## help
## https://stackoverflliow.com/questions/26838760/convert-matrix-to-three-column-data-frame

meltee <- lapply(mats, function(m) setNames(melt(m), c('rows', 'vars', 'values')))


meltPlot <- lapply(meltee, function(m) ggplot(m, aes(rows, vars)) + geom_raster(aes(fill = values)))

