# Run as dust marker
execute unless entity @s[x=-152,y=42,z=891,dx=9,dy=10,dz=8] run return fail

tp @s ^ ^ ^0.8
particle dust 0.9 0.9 0.9 0.4 ~-0.2 ~-0.15 ~-0.2 0.4 0.6 1.5 0 1

# Loop
execute as @s at @s run function projektredstoneworld:rebornxprojdust
