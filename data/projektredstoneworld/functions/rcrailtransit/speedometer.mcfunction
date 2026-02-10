# Run every tick while in minecart as player in minecart

# Get positions
execute as @s store result score @s rcspeedx run data get entity @s Pos[0] 1000
execute as @s store result score @s rcspeedz run data get entity @s Pos[2] 1000
# Get deltas
scoreboard players operation @s rcspeeddx = @s rcspeedx
scoreboard players operation @s rcspeeddx -= @s rcspeedxo
scoreboard players operation @s rcspeeddz = @s rcspeedz
scoreboard players operation @s rcspeeddz -= @s rcspeedzo
# Replace old values
scoreboard players operation @s rcspeedxo = @s rcspeedx
scoreboard players operation @s rcspeedzo = @s rcspeedz
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
execute if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:minecart"}}}] run title @s actionbar [{"text":"RCorp speedometer: ","color":"#999999"},{"score":{"name":"#rcrspeedspeed","objective":"info"},"color":"#CC4444","bold":true},{"text":".","color":"#CC4444","bold":true},{"score":{"name":"#rcrspeedspeedmod","objective":"info"},"color":"#CC4444","bold":true},{"text":" blocks/sec ","color":"#CC4444","bold":false},{"text":"(","color":"#55AABB","bold":false},{"score":{"name":"#rcrspeedspeedk","objective":"info"},"color":"#55AABB","bold":true},{"text":".","color":"#55AABB","bold":true},{"score":{"name":"#rcrspeedspeedkmod","objective":"info"},"color":"#55AABB","bold":true},{"text":" km/h)","color":"#55AABB","bold":false}]