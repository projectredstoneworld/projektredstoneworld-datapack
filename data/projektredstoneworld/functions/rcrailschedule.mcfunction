schedule function projektredstoneworld:rcrailschedule 10t

#speedometer and dest messaging
execute in overworld as @a[tag=rcrailrider,x=0] on vehicle if entity @s[type=pig] on passengers run function projektredstoneworld:rcrailtransit/speedometer

# Dismount if not paid
execute in overworld as @a[tag=rcrailrider,x=0] on vehicle if entity @s[type=pig,tag=rcrailseat] on passengers unless score @s rcrailpay matches 1.. run ride @s dismount

# Handle rider tag
execute in overworld run tag @a[tag=rcrailrider,x=0] remove rcrailrider
execute in overworld if entity @e[type=pig,tag=rcrailseat,x=0] as @a on vehicle if entity @s[type=pig,tag=rcrailseat,x=0] on passengers run tag @s add rcrailrider

# Contextualize server time (WE NEED TO RESET GAMETIME SOON BEFORE IT REACHES 32 BIT INT LIMIT!!)
execute store result score #servertimer rcrailtimer run time query gametime

# Handle pod time out
execute in overworld run tag @e[type=minecart,tag=rcraildrive,x=0] remove handledPodTimeOut
execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=!handledPodTimeOut,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/podtimeout

# Can do this outside podtimeout function since we don't need it to run for each pod
execute in overworld as @e[type=pig,tag=rcrailseat,x=0] run scoreboard players operation @s rcrailtimerdiff = #servertimer rcrailtimer
execute in overworld as @e[type=pig,tag=rcrailseat,x=0] run scoreboard players operation @s rcrailtimerdiff -= @s rcrailtimer

# 30 second timeout for pods in motion
execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailaged] at @s if score @s rcrailtimerdiff matches 600.. run function projektredstoneworld:rcrailtransit/killrcrailcar
execute in overworld as @e[type=pig,tag=rcrailseat,x=0] at @s if entity @e[type=minecart,tag=rcraildrive,distance=..10,tag=!rcrailaged] run scoreboard players set @s rcrailtimerdiff 0
execute in overworld as @e[type=pig,tag=rcrailseat,x=0] if score @s rcrailtimerdiff matches 610.. run kill @s
# 60 second timeout for pods at station
execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=!rcrailaged] at @s if score @s rcrailtimerdiff matches 1200.. run function projektredstoneworld:rcrailtransit/killrcrailcar

# Ambient pod sounds
execute as @e[type=minecart,tag=rcraildrive,x=0] run function projektredstoneworld:rcrailtransit/ambientsound

function projektredstoneworld:rcrailtransit/stationmsg

execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailarrive] at @s unless entity @a[tag=rcrailrider,distance=..7] run tag @s add rcrailtokill
execute in overworld run tag @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailtokill,tag=rcrailarrive] remove rcrailarrive

#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatf,limit=1,distance=..10] ^1.5 ^5 ^
#execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatb,limit=1,distance=..10] ^-1.5 ^5 ^
#execute as @e[tag=rcrailcar,tag=!rcraildrive,tag=!rcrailanchor] run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1] Rotation[0]

execute in overworld as @e[type=marker,tag=rcsmanager,x=0] at @s as @e[type=item,distance=..30,nbt={Item:{id:"minecraft:saddle"}}] unless data entity @s Thrower run kill @s