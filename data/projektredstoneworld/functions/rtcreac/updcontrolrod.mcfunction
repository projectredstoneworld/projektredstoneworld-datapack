# Please execute this as @e[tag=rtcreactorcrod] at @s positioned ~ ~1 ~
fill ~ ~ ~ ~ ~-31 ~ water replace andesite_wall
scoreboard players operation @s rtcreactempcrod = #rtcreactorrodblocks info
execute if score @s rtcreactempcrod matches ..0 run return fail
execute as @s at @s positioned ~ ~1 ~ run function projektredstoneworld:rtcreac/controlrodrecursion
