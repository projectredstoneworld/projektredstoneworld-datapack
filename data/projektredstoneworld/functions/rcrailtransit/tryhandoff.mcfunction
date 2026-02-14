# Check empty!
execute if entity @s[tag=rcrailneg] at @e[type=marker,distance=..15,tag=rcsneg] if entity @e[tag=rcraildrive,distance=..1,type=minecart] run return fail
execute if entity @s[tag=rcrailpos] at @e[type=marker,distance=..15,tag=rcspos] if entity @e[tag=rcraildrive,distance=..1,type=minecart] run return fail

# Spawn on appropriate side
execute if entity @s[tag=rcrailneg] at @e[type=marker,distance=..15,tag=rcsneg] run function projektredstoneworld:spawncarrcrail
execute if entity @s[tag=rcrailpos] at @e[type=marker,distance=..15,tag=rcspos] run function projektredstoneworld:spawncarrcrail

# Apply rcsid
scoreboard players operation @e[type=minecart,tag=rcraildrive,tag=!rcrhandled,sort=nearest,limit=1,distance=..20] rcsid = @s rcsid
execute as @e[type=minecart,tag=rcraildrive,tag=!rcrhandled,sort=nearest,limit=1,distance=..20] run function projektredstoneworld:rcrailtransit/applycoords
tag @e[type=minecart,tag=rcraildrive,tag=!rcrhandled,sort=nearest,limit=1,distance=..20] add rcrhandled
