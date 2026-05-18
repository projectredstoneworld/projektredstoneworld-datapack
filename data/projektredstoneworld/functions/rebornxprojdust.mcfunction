# Run as dust marker
execute unless entity @s[x=-152,y=42,z=891,dx=9,dy=10,dz=8] run return fail

tp @s ^ ^ ^0.2
execute at @s run particle white_ash ~ ~ ~ 0.4 0.3 0.4 0.03 2

# Loop
function projektredstoneworld:rebornxprojdust
