schedule function projektredstoneworld:rcrailschedule 10t

#speedometer and dest messaging
execute in overworld as @a[tag=rcrailrider,x=0] on vehicle if entity @s[type=pig] on passengers run function projektredstoneworld:rcrailtransit/speedometer

# Dismount if not paid
execute in overworld as @a[tag=rcrailrider,x=0] on vehicle if entity @s[type=pig,tag=rcrailseat] on passengers unless score @s rcrailpay matches 1.. run ride @s dismount

# Handle rider tag
execute in overworld run tag @a[tag=rcrailrider,x=0] remove rcrailrider
execute in overworld if entity @e[type=pig,tag=rcrailseat,x=0] as @a on vehicle if entity @s[type=pig,tag=rcrailseat,x=0] on passengers run tag @s add rcrailrider

# Ambient pod sounds
execute as @e[type=minecart,tag=rcraildrive,x=0] run function projektredstoneworld:rcrailtransit/ambientsound

function projektredstoneworld:rcrailtransit/stationmsg

execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailarrive] at @s unless entity @a[tag=rcrailrider,distance=..7] run tag @s add rcrailtokill
execute in overworld run tag @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailtokill,tag=rcrailarrive] remove rcrailarrive

#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatf,limit=1,distance=..10] ^1.5 ^5 ^
#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatb,limit=1,distance=..10] ^-1.5 ^5 ^
#execute as @e[tag=rcrailcar,tag=!rcraildrive,tag=!rcrailanchor] run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1] Rotation[0]