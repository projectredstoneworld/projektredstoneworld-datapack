# Execute this as either rcspos or rcsneg marker



#power self
data modify entity @s data.block set value "minecraft:redstone_block"
function projektredstoneworld:macrosetblock with entity @s data
tag @s add rcrailpowered
tag @e[tag=rcraildrive,type=minecart,distance=..1,limit=1,sort=nearest] add rcrailaged
execute if score @s rcrailunpowertime matches 1 run tag @e[tag=rcraildrive,type=minecart,distance=..2,limit=1,sort=nearest] add closingrcr
execute if score @s rcrailunpowertime matches 1 at @e[type=minecart,tag=rcraildrive,tag=closingrcr,distance=..10] run function projektredstoneworld:rcrailtransit/doorclose1

execute unless score @s rcrailunpowertime matches 30.. run scoreboard players add @s rcrailunpowertime 1

# Can't simply schedule the unpower, as that would run as the server, and if we tagged the marker it could interfere with other markers. 

execute if score @s rcrailunpowertime matches 30.. run function projektredstoneworld:rcrailtransit/unpowerstationdepart