# summon dummy entity to store our data, this wont cause any lag cause it litteraly cant do shit
execute in minecraft:overworld positioned -266.51 49.00 388.49 run summon marker ~ ~ ~ {Tags:["rcrail_marker","rcrail_new"],CustomName:"\"RCorp Rail Payment Account\""}

# match it up with our id system
scoreboard players operation @e[tag=rcrail_new] redstoneworldID = @s redstoneworldID
scoreboard players operation @e[tag=rcrail_new] rcrailpay = @s rcrailpay

# mark as finish setup
tag @e[tag=rcrail_new] remove rcrail_new