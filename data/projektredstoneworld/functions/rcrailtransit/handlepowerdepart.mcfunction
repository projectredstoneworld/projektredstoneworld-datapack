# Execute this as either rcspos or rcsneg marker



#power self
data modify entity @s data.block set value "minecraft:redstone_block"
function projektredstoneworld:macrosetblock with entity @s data

execute unless score @s rcrailunpowertime matches 20.. run scoreboard players add @s rcrailunpowertime 1
execute unless score @s rcrailunpowertime matches 20.. run return run function projektredstoneworld:rcrailtransit/handlepowerdepart

# Can't simply schedule the unpower, as that would run as the server, and if we tagged the marker it could interfere with other markers. 

execute if score @s rcrailunpowertime matches 20.. run function projektredstoneworld:rcrailtransit/unpowerstationdepart