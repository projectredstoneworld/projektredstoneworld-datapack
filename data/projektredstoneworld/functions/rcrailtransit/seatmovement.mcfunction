tag @s add handleSeatMovement

execute if entity @s[nbt={Motion:[0.0,0.0,0.0]}] rotated as @s as @e[type=pig,x=0,tag=rcrailseatf] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^1.5 ^5 ^
execute if entity @s[nbt={Motion:[0.0,0.0,0.0]}] rotated as @s as @e[type=pig,x=0,tag=rcrailseatb] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-1.5 ^5 ^
execute at @s unless entity @e[tag=rcsmanager,distance=..30,type=marker] if score @s rcrspeedupspeed matches 0 rotated as @s as @e[type=pig,x=0,tag=rcrailseatf] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-1.5 ^5 ^
execute at @s unless entity @s[tag=rcsmanager,distance=..30,type=marker] if score @s rcrspeedupspeed matches 0 rotated as @s as @e[type=pig,x=0,tag=rcrailseatb] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-3.5 ^5 ^
execute if score @s rcrspeedupspeed matches 1..2 rotated as @s as @e[type=pig,x=0,tag=rcrailseatf] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-2.0 ^5 ^
execute if score @s rcrspeedupspeed matches 1..2 rotated as @s as @e[type=pig,x=0,tag=rcrailseatb] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-5.0 ^5 ^
execute if score @s rcrspeedupspeed matches 3 rotated as @s as @e[type=pig,x=0,tag=rcrailseatf] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-5.0 ^5 ^
execute if score @s rcrspeedupspeed matches 3 rotated as @s as @e[type=pig,x=0,tag=rcrailseatb] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handleSeatMovement,limit=1,sort=nearest] redstoneworldID run tp @s ^-7.0 ^5 ^


tag @s remove handleSeatMovement
tag @s add handledSeatMovement
execute in overworld as @e[tag=rcraildrive,type=minecart,x=0,tag=!handledSeatMovement,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/seatmovement
