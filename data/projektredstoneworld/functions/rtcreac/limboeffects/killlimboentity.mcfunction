# Execute as limbo entity, kills that entity and cleans up scores and plays effect to player
scoreboard players reset @s redstoneworldID
scoreboard players reset @s limboeffecttime

execute at @s run playsound minecraft:entity.cat.hiss master @a[distance=..32] ~ ~ ~ 2 0

kill @s
