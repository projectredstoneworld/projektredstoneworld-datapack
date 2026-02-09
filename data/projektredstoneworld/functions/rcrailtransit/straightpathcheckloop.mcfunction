# LOOPING CODE -------------
# Raycast and recurse
function projektredstoneworld:teleportmacrorelative with entity @s data
execute unless block ~ ~ ~ powered_rail at @s run return run function projektredstoneworld:rcrailtransit/straightpathcheckend
scoreboard players add @e[type=minecart,sort=nearest,limit=1,distance=..33,tag=minecartgayrcrail] rcrailcartstraight 1
execute if score @e[type=minecart,sort=nearest,limit=1,distance=..33,tag=minecartgayrcrail] rcrailcartstraight matches ..31 at @s run function projektredstoneworld:rcrailtransit/straightpathcheckloop
execute if score @e[type=minecart,sort=nearest,limit=1,distance=..33,tag=minecartgayrcrail] rcrailcartstraight matches 32.. at @s run function projektredstoneworld:rcrailtransit/straightpathcheckend