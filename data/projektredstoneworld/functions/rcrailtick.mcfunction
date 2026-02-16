schedule function projektredstoneworld:rcrailtick 1t
#execute as @e[tag=rcrailseatf] at @s rotated as @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10] run tp @s ^0.05 ^ ^
#execute as @e[tag=rcrailseatb] at @s rotated as @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10] run tp @s ^0.05 ^ ^
execute in overworld run tag @e[tag=rcraildrive,type=minecart,x=0] remove handledSeatMovement
execute in overworld as @e[tag=rcraildrive,type=minecart,x=0,tag=!handledSeatMovement,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/seatmovement

execute in overworld run tag @e[tag=rcraildrive,type=minecart,x=0] remove handledPodRotation
execute in overworld as @e[tag=rcraildrive,type=minecart,x=0,tag=!handledPodRotation,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/podrotation


execute as @e[type=minecart,tag=rcraildrive] at @s run function projektredstoneworld:rcrailtransit/dospeedup
execute in overworld as @e[type=marker,tag=rcrailpowered,x=0] at @s run function projektredstoneworld:rcrailtransit/handlepowerdepart
