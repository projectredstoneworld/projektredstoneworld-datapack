tellraw @s {"text":"Sporadic effect (lv 2)"}
playsound minecraft:ambient.underwater.loop.additions.ultra_rare master @s ~ ~ ~ 1 0.5 1
playsound minecraft:ambient.basalt_deltas.mood master @s ~ ~ ~ 1 0 1
playsound minecraft:ambient.basalt_deltas.mood master @s ~ ~ ~ 1 0 1
effect give @s slowness 2 0 true

tag @s add limbosteps1
execute unless entity @a[tag=limbosteps1] run schedule function projektredstoneworld:rtcreac/limboeffects/footsteps1 120t
