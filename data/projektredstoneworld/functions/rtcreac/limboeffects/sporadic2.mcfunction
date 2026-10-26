tellraw @s {"text":"Sporadic effect (lv 2)"}
playsound minecraft:ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 1 0.5 1
playsound minecraft:ambient.basalt_deltas.mood master @s ~ ~ ~ 1 0 1
playsound minecraft:ambient.basalt_deltas.mood master @s ~ ~ ~ 1 0 1
effect give @s slowness 2 0 true

execute unless score #limbosteptimer info matches 1..89 run scoreboard players set #limbosteptimer info 120
tag @s add limbosteps1
