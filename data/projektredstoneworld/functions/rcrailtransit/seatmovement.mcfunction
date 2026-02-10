tag @s add handleSeatMovement

execute rotated as @s as @e[type=pig,x=0,tag=rcrailseatf] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^1.5 ^5 ^
execute rotated as @s as @e[type=pig,x=0,tag=rcrailseatb] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-1.5 ^5 ^

tag @s remove handleSeatMovement
tag @s add handledSeatMovement
execute in overworld as @e[tag=rcraildrive,type=minecart,x=0,tag=!handledSeatMovement,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/seatmovement
