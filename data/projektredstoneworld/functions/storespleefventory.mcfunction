# summon dummy entity to store our data, this wont cause any lag cause it litteraly cant do shit
execute in minecraft:plotworld positioned -795.07 108.00 1124.51 run summon marker ~ ~ ~ {Tags:["spleefinv_store","spleefinv_new"]}

# match it up with our id system
scoreboard players operation @e[tag=spleefinv_new] redstoneworldID = @s redstoneworldID
# copy our inventory to its
data modify entity @e[tag=spleefinv_new,limit=1] data.Inventory set from entity @s Inventory
# mark as finish copying
tag @e[tag=spleefinv_new] remove spleefinv_new
