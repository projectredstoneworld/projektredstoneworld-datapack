setblock ~ ~ ~ andesite_wall[waterlogged=true,up=true]
scoreboard players remove @s rtcreactempcrod 1
execute if score @s rtcreactempcrod matches 0 run return fail
execute as @s positioned ~ ~-1 ~ run function projektredstoneworld:rtcreac/controlrodrecursion
