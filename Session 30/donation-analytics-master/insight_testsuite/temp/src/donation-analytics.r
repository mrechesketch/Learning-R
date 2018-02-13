args <- commandArgs(TRUE)

itcont <- args[1]
perc <- args[2]
output <- args[3]


main <- function(...){
    args <- list(...)
    for( item in args ) print(item)

}

if( !interactive() ){
    print("something")
    main(itcont, perc, output)
}