execute if score #rtcreactorcoretemp info matches ..1500 run return fail
execute if score #rtcreactorboric info matches 1.. run return fail
execute if score #rtcreactorfuelmode info matches 0 run return fail
execute if score #rtcreactorwatermode info matches 0 run return fail

# Do not rereun if this has already triggered
execute unless score #rtcreactorimmtime info matches 0 run return fail

# Immunize people in the control room for 2 minutes to unleash the limbo sequence
tag @a[x=97,y=-16,z=571,dx=26,dy=18,dz=31] add rtcreacimmune
scoreboard players set #rtcreactorimmtime info 2400
tellraw @a[tag=rtcreacimmune] {"text":"A brilliant aura surrounds your body, miraculously shielding you from radiation for two minutes. Nobody knows what caused it, or where it came from. The only thing we know is that it was caused by two forces clashing, including one that is strengthening.","color":"#FFFF00"}
effect give @a[tag=rtcreacimmune] glowing 120 0 true
