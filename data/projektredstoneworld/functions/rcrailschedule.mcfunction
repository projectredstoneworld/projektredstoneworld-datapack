schedule function projektredstoneworld:rcrailschedule 10t

execute in overworld as @a[tag=rcrailrider,x=0] on vehicle if entity @s[type=pig] on passengers run function projektredstoneworld:rcrailtransit/speedometer
# skibidi toilet yes bop bop hello hello good to be back
#kab m'I kcab eb ot doog kcab eb ot doog olleh olleh kcab eb ot doog bop bop yes toilet skibidi

#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatf,limit=1,distance=..10] ^1.5 ^5 ^
#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatb,limit=1,distance=..10] ^-1.5 ^5 ^
#execute as @e[tag=rcrailcar,tag=!rcraildrive,tag=!rcrailanchor] run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1] Rotation[0]