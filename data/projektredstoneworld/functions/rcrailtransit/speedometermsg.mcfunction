# Called one tick later

# Get positions
execute as @s store result score @s rcspeedx run data get entity @s Pos[0] 1000
execute as @s store result score @s rcspeedz run data get entity @s Pos[2] 1000
# Get deltas
scoreboard players operation @s rcspeeddx = @s rcspeedx
scoreboard players operation @s rcspeeddx -= @s rcspeedxo
scoreboard players operation @s rcspeeddz = @s rcspeedz
scoreboard players operation @s rcspeeddz -= @s rcspeedzo


# Absval them
execute if score @s rcspeeddx matches ..-1 run scoreboard players operation @s rcspeeddx *= -1 CONSTANTS
execute if score @s rcspeeddz matches ..-1 run scoreboard players operation @s rcspeeddz *= -1 CONSTANTS
# Invalidate if too large (limit = 5 blocks/tick)
execute if score @s rcspeeddx matches 5000.. run scoreboard players set @s rcspeeddx 0
execute if score @s rcspeeddz matches 5000.. run scoreboard players set @s rcspeeddz 0

scoreboard players operation #rcrspeedspeed info = @s rcspeeddx
execute if score @s rcspeeddz > @s rcspeeddx run scoreboard players operation #rcrspeedspeed info = @s rcspeeddz
# Mult. root 2 if x = z
execute if score @s rcspeeddx = @s rcspeeddz run scoreboard players operation #rcrspeedspeed info *= 1414 CONSTANTS
execute if score @s rcspeeddx = @s rcspeeddz run scoreboard players operation #rcrspeedspeed info /= 1000 CONSTANTS

# Lag compensate
scoreboard players operation #rcrspeedspeed info *= tpscalc tps_system
# Copy speed for km/h
scoreboard players operation #rcrspeedspeedk info = #rcrspeedspeed info

# Process km/h
# For rounding to nearest rather than floor
scoreboard players add #rcrspeedspeedk info 1333
scoreboard players operation #rcrspeedspeedk info /= 2778 CONSTANTS
# Decimals
scoreboard players operation #rcrspeedspeedkmod info = #rcrspeedspeedk info
scoreboard players operation #rcrspeedspeedkmod info %= 10 CONSTANTS
scoreboard players operation #rcrspeedspeedk info /= 10 CONSTANTS

# Process m/s
# For rounding to neareast rather than floor
scoreboard players add #rcrspeedspeed info 5000
scoreboard players operation #rcrspeedspeed info /= 10000 CONSTANTS
# Decimals
scoreboard players operation #rcrspeedspeedmod info = #rcrspeedspeed info
scoreboard players operation #rcrspeedspeedmod info %= 10 CONSTANTS
scoreboard players operation #rcrspeedspeed info /= 10 CONSTANTS

# Display!
execute if entity @s run title @s times 0 20 0 
execute if entity @s run title @s title ""

# Destination subtitle
execute store result score #rcrstationdesttemp info run scoreboard players get @e[type=minecart,limit=1,sort=nearest,distance=..10,tag=rcraildrive] rcsid
execute if entity @s if score #rcrstationdesttemp info matches 0 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Testing Sector","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 1 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Theme Park","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 2 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Cruise Ship","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 3 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Dos Village","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 4 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Main Bunker","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 5 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"SMP Base (Dos)","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 6 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Gerudo Desert","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 7 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Emil's Villa","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 8 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Rakeport","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 9 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Founding Island - Spawn","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 10 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Forgotten Isle","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 11 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"FI Bunker","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 12 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Tavish Town","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 13 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Global Control / Founding Desert","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 14 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Eastern Village","color":"#E44444"}]
execute if entity @s if score #rcrstationdesttemp info matches 14 run title @s subtitle [{"text":"Destination: ","color":"#AAAAAA"},{"text":"Blakewood Outpost","color":"#E44444"}]




execute if entity @s if score #rcrspeedspeed info matches 0.. run title @s actionbar [{"text":"RCorp speedometer: ","color":"#999999"},{"score":{"name":"#rcrspeedspeed","objective":"info"},"color":"#CC4444","bold":true},{"text":".","color":"#CC4444","bold":true},{"score":{"name":"#rcrspeedspeedmod","objective":"info"},"color":"#CC4444","bold":true},{"text":" blocks/sec ","color":"#CC4444","bold":false},{"text":"(","color":"#55AABB","bold":false},{"score":{"name":"#rcrspeedspeedk","objective":"info"},"color":"#55AABB","bold":true},{"text":".","color":"#55AABB","bold":true},{"score":{"name":"#rcrspeedspeedkmod","objective":"info"},"color":"#55AABB","bold":true},{"text":" km/h)","color":"#55AABB","bold":false}]
tag @s remove speedometertarget

#@s[nbt={RootVehicle:{Entity:{id:"minecraft:minecart"}}}]