data modify entity @s data.block set value "minecraft:deepslate_tiles"
function projektredstoneworld:macrosetblock with entity @s data
scoreboard players set @s rcrailunpowertime 0
tag @s remove rcrailpowered