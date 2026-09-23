# Ran as every player entering limbo

advancement grant @s only redstoneworld:rtclimboenter
tag @s remove rtcreacimmune
effect clear @s

execute in overworld run tp @s 164.5 -40.0 503.0 0 0

scoreboard players set @s limbolvl 1

# Inventory store
function projektredstoneworld:rtcreac/storelimboventory
tag @s add limbo
