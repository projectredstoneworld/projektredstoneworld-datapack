# summon dummy entity to store our data, this wont cause any lag cause it litteraly cant do shit
execute in minecraft:overworld positioned -266.68 49.00 386.30 run summon marker ~ ~ ~ {Tags:["rakeinv_store","rakeinv_new"]}

# match it up with our id system
scoreboard players operation @e[tag=rakeinv_new] redstoneworldID = @s redstoneworldID
# copy our inventory to its
data modify entity @e[tag=rakeinv_new,limit=1] data.Inventory set from entity @s Inventory
# mark as finish copying
tag @e[tag=rakeinv_new] remove rakeinv_new
