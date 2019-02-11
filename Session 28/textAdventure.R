# Grindr Gary's (mis)Adventure 

rm( list = ls() )

# =============================================================================
# declare the house
# =============================================================================

house <- new.env( parent = emptyenv() )

# declare all the rooms
    # downstairs
kitchen <- new.env( parent = house )
hallway <- new.env( parent = house ) 
study <- new.env( parent = house )
    # stairs
stairs <- new.env( parent = house ) # between hallway and landing
    # upstairs
landing <- new.env( parent = house )
master_bedroom <- new.env( parent = house )
master_bath <- new.env( parent = house )
master_closet <- new.env( parent = house )
guest_bedroom <- new.env( parent = house )
guest_bathroom <- new.env( parent = house )


# =============================================================================
# move between rooms
# =============================================================================


assign(x = "set_scene",
    value = function(dst_string){
        switch(dst_string,
        "kitchen" = paste("A large kitchen with very many cupboards and cabinets.", # too long for one line
        " On one end a hallway and on the other, a sliding door to the backyard"),
        "hallway" = "A hallway between the kitchen and the study",
        "something went wrong")
    },
    envir = house)


assign(x = "go", # kitchen.go
    value = function(dst){
        detach(kitchen)
        dst_string <- deparse(substitute(dst))
        switch(dst_string,
        "hallway" = attach(hallway),
        "backyard" = attach(sliding_door) )
        with(house, set_scene)(dst_string) # retrieve function and call it on destination string
    },
    envir = kitchen)


# =============================================================================
# now add items to rooms
# =============================================================================

    # kitchen
assign(x = "cabinet", value = "cabinet", envir = kitchen ) 
assign(x = "cabinet.isopen", value = FALSE, envir = kitchen )
assign(x = "sign", value = "sign", envir = kitchen )
assign(x = "sliding_door", value = "sliding_door", envir = kitchen )
assign(x = "sliding_door.isopen", value = FALSE, envir = kitchen )

    # hallway
assign(x = "statue", value = "statue", envir = hallway)

    # study
assign(x = "front_door", value = "front_door", envir = hallway)
assign(x = "front_door.isopen", value = FALSE, envir = hallway) 


# =============================================================================
# add functionality to items
# =============================================================================

assign(x = "info.none", # default message
    value = "doesn't seem like you can get info on this item.. or maybe there is not item to get info on?",
    envir = house)

assign("info", # kitchen.info
    value = function(item){
        switch(item,
        "cabinet" = "hmm, seems like it can be opened",
        "sign" = "a strange small sign.. have you hugged your horse today?",
        "sliding_door" = "a glass sliding door to the backyard, better make sure it's locked",
        "knife" = if ( cabinet.isopen ) "this looks sharp" else with(house, info.none),
        "vitamins" = if ( cabinet.isopen ) "so many unopened vitamins... and cat vitamins? interesting" else with(house, info.none),
        "key" = if ( cabinet.isopen ) "looks like it could open something" else with(house, info.none),
        with(house, info.none) )
    },
    envir = kitchen)


assign("info", # hallway.info 
    value = function(item){
        switch(item,
        "statue" = "a 3 foot marble statue of a horse, likely expensive",
        with(house, info.none))
    },
    envir = hallway)


# start the game

