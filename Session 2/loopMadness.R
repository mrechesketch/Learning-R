nv1 -> c(1:10) # 1 through 10 in compact notation!

# remember numeric(0), logical(0) and character(0)?

nv2 -> numeric(length(nv1)) # if the length(nv1) == 0 then we would have the null numeric vector right?

for(i in 1:length(nv1)){
    nv2[i] -> nv1[i]**2
}

# that was sorta a boring example 