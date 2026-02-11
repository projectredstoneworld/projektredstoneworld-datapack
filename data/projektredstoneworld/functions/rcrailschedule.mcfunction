schedule function projektredstoneworld:rcrailschedule 10t

execute in overworld as @a[tag=rcrailrider,x=0] on vehicle if entity @s[type=pig] on passengers run function projektredstoneworld:rcrailtransit/speedometer

execute in overworld run tag @a[tag=rcrailrider,x=0] remove rcrailrider
execute in overworld if entity @e[type=pig,tag=rcrailseat,x=0] as @a on vehicle if entity @s[type=pig,tag=rcrailseat,x=0] on passengers run tag @s add rcrailrider

# Ambient pod sounds
execute at @e[type=minecart,tag=rcraildrive] run playsound minecraft:block.bell.resonate master @a[distance=..15,tag=!rcrailrider] ~ ~ ~ 1 0
execute at @e[type=minecart,tag=rcraildrive] run playsound minecraft:block.bell.resonate master @a[distance=15..32] ~ ~ ~ 0.05 0 0.05
execute as @a[tag=rcrailrider] at @s run playsound minecraft:block.bell.resonate master @s ~ ~ ~ 0.123 0

#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatf,limit=1,distance=..10] ^1.5 ^5 ^
#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatb,limit=1,distance=..10] ^-1.5 ^5 ^
#execute as @e[tag=rcrailcar,tag=!rcraildrive,tag=!rcrailanchor] run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1] Rotation[0]