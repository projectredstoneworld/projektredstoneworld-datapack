# Make sure at least x blocks are air
execute at @s run tp @s ^ ^ ^-1
execute unless block ~ ~ ~ air run return fail
scoreboard players remove #rtcreactorintermediate2 info 1
execute if score #rtcreactorintermediate2 info matches 1.. run function projektredstoneworld:rtcreac/limboeffects/spawnentitycheckloop
