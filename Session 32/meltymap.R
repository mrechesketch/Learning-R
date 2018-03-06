
vecs <- list(
    "sins" = sin(1:100),
    "tans" = tan(1:100),
    "rands" = runif(100)
)

mats <- lapply(vecs, function(v) matrix(v, nrow = 10, ncol = 10) )

## help
## https://stackoverflow.com/questions/26838760/convert-matrix-to-three-column-data-frame

