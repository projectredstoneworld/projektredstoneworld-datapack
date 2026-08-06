# make sure we can access the markers
forceload add -264 384 -264 364
# summon dummy entity to store our data, this wont cause any lag cause it litteraly cant do shit
execute in minecraft:overworld positioned -267.68 49.00 390.30 run summon marker ~ ~ ~ {Tags:["limboinv_store","limboinv_new"]}

# match it up with our id system
scoreboard players operation @e[tag=limboinv_new] redstoneworldID = @s redstoneworldID
# copy our inventory to its
data modify entity @e[tag=limboinv_new,limit=1] data.Inventory set from entity @s Inventory
# mark as finish copying
tag @e[tag=limboinv_new] remove limboinv_new

