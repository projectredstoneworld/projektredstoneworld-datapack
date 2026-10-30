# Run as player in limbo
kill @e[type=marker,tag=limboentitytest]
execute at @s run summon marker ~ ~ ~ {Tags:["limboentitytest"]}
# Get player rotation to nearest 90 degrees
execute store result score #rtcreactorintermediate info run data get entity @s Rotation[0]
scoreboard players add #rtcreactorintermediate info 1
scoreboard players operation #rtcreactorintermediate info /= 2 CONSTANTS
scoreboard players operation #rtcreactorintermediate info *= 90 CONSTANTS
execute store result entity @e[tag=limboentitytest,limit=1] data.rot float 1 run scoreboard players get #rtcreactorintermediate info
# For jumpscare audio in case spawn fails
execute store result entity @e[tag=limboentitytest,limit=1] data.pid int 1 run scoreboard players get @s redstoneworldID
# 20% chance of spawning in front of player
execute store result entity @e[tag=limboentitytest,limit=1] data.fwd int 1 run random value 1..5
# Begin checking that spawn location is valid
execute as @e[type=marker,tag=limboentitytest] run function projektredstoneworld:rtcreac/limboeffects/spawnentitystartcheck with entity @s data
# Intermediate 2 is 0 if check succeeds
tellraw @s [{"text":"Scary entity spawn check: "}, {"score":{"name":"#rtcreactorintermediate2","objective":"info"}}]
