# summon dummy entity to store our data, this wont cause any lag cause it litteraly cant do shit
execute in minecraft:overworld positioned -291.50 84.81 458.43 run summon marker ~ ~ ~ {Tags:["inv_store","inv_new"]}

# match it up with our id system
scoreboard players operation @e[tag=inv_new] redstoneworldID = @s redstoneworldID
# copy our inventory to its
data modify entity @e[tag=inv_new,limit=1] data.Inventory set from entity @s Inventory
# mark as finish copying
tag @e[tag=inv_new] remove inv_new
