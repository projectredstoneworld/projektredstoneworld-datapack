# Ran as every player entering limbo

advancement grant @s only redstoneworld:rtclimboenter
tag @s remove rtcreacimmune
effect clear @s

execute in overworld run tp @s 164.5 -40.0 503.0 0 0

scoreboard players set @s limbolvl 1

# Inventory store
function projektredstoneworld:rtcreac/storelimboventory
tag @s add limbo
scoreboard players set #limboactive info 1
execute store result score @s limboeffecttime run random value 600..1200
