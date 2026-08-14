fill ~ ~ ~ ~ ~ ~ andesite_wall[waterlogged=true,up=true] replace light[level=15,waterlogged=true]
fill ~ ~ ~ ~ ~ ~ andesite_wall[waterlogged=false,up=true] replace light[level=15,waterlogged=false]
scoreboard players remove @s rtcreactempcrod 1
execute if score @s rtcreactempcrod matches 0 run return fail
execute as @s positioned ~ ~-1 ~ run function projektredstoneworld:rtcreac/controlrodrecursion
