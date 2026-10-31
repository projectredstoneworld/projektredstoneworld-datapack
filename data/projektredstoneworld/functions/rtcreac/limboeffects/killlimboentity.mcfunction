# Execute as limbo entity, kills that entity and cleans up scores and plays effect to player
scoreboard players reset @s redstoneworldID
scoreboard players reset @s limboeffecttime

execute at @s if entity @s[tag=!limboentityunseen] run tellraw @p {"text":"Limbo entity died seen"}
execute at @s if entity @s[tag=limboentityunseen] run tellraw @p {"text":"Limbo entity died unseen"}

kill @s
