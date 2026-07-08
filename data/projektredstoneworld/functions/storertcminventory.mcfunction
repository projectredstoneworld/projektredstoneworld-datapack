# execute this as tag t3tortcm limit=1!! actually probably dont need the tag!
# make sure we can access the markers
forceload add -264 384 -264 364
# summon dummy entity to store our data, this wont cause any lag cause it litteraly cant do shit
execute in minecraft:overworld positioned -266.68 49.00 390.30 run summon marker ~ ~ ~ {Tags:["rtcminv_store","rtcminv_new"]}

# match it up with our id system
scoreboard players operation @e[tag=rtcminv_new] redstoneworldID = @s redstoneworldID
# copy our inventory to its
data modify entity @e[tag=rtcminv_new,limit=1] data.Inventory set from entity @s Inventory
# mark as finish copying
tag @e[tag=rtcminv_new] remove rtcminv_new
clear @s
tag @s add rtcm
execute as @s[x=5.0,y=277.9,z=673.0,dx=4.0,dy=5.1,dz=8.0,gamemode=!spectator] at @s run tp @s ~290 ~-274 ~-30
#tag @s remove t3tortcm
execute as @a[x=5.0,y=277.9,z=673.0,dx=4.0,dy=5.1,dz=8.0,gamemode=!spectator,limit=1,sort=random] at @s run function projektredstoneworld:storertcminventory
