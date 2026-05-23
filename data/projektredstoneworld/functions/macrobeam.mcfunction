# Run as marker, this will kill the marker!

# Datas:
# Yaw, Pitch, Density (blocks per particle), R, G, B, Scale, Iterations

# Yaw, pitch
$execute at @s run tp @s ~ ~ ~ $(yaw) $(pitch)

# Prepare to call loop function
scoreboard players set #macrobeamiterations info 0

# Call loop function
execute at @s run function projektredstoneworld:macrobeamloop with entity @s
