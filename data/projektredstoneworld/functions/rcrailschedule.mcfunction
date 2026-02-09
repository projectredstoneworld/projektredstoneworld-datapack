#schedule function projektredstoneworld:rcrailschedule 4t

#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatf,limit=1,distance=..10] ^1.5 ^5 ^
#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatb,limit=1,distance=..10] ^-1.5 ^5 ^
#execute as @e[tag=rcrailcar,tag=!rcraildrive,tag=!rcrailanchor] run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1] Rotation[0]