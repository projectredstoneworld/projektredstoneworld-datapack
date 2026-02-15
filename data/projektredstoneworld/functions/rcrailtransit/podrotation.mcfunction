tag @s add handlePotRotation

execute at @s as @e[type=armor_stand,tag=rcrailanchor,limit=1,sort=nearest,distance=..10] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10,tag=handlePotRotation] redstoneworldID store result score @s rcrailrot run data get entity @s Rotation[0]
execute at @s store result score @s rcrailrot run data get entity @s Rotation[0]

execute at @s unless score @s rcrailrot = @e[type=armor_stand,tag=rcrailanchor,limit=1,sort=nearest,distance=..4] rcrailrot as @e[tag=rcrailcar,tag=!rcraildrive,distance=..10] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10,tag=handlePotRotation] redstoneworldID run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1,distance=..10,sort=nearest,tag=handlePotRotation] Rotation[0]


tag @s remove handlePotRotation
tag @s add handledPodRotation
execute in overworld as @e[tag=rcraildrive,type=minecart,x=0,tag=!handledPodRotation,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/podrotation