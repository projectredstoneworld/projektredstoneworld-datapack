# run as a random player exiting limbo, should have tag needlimborestore
# Make sure no one else is currently getting restored
execute if entity @a[tag=restoretargetlimbo] run return fail
# make sure we can access the markers
forceload add -264 384 -264 364

tag @s add restoretargetlimbo
tag @s remove limbo
clear @s

execute as @e[type=marker,tag=limboinv_store] if score @s redstoneworldID = @a[tag=restoretargetlimbo,limit=1] redstoneworldID run function projektredstoneworld:rtcreac/inventoryrestorelimbo

tag @s remove restoretargetlimbo
tag @s remove needlimborestore

execute as @a[tag=needlimborestore,gamemode=!spectator,limit=1] at @s run function projektredstoneworld:rtcreac/initlimborestore