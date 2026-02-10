schedule function projektredstoneworld:rcrailtick 1t
#execute as @e[tag=rcrailseatf] at @s rotated as @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10] run tp @s ^0.05 ^ ^
#execute as @e[tag=rcrailseatb] at @s rotated as @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10] run tp @s ^0.05 ^ ^

execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatf,limit=1,distance=..10] ^1.5 ^5 ^
execute as @e[tag=rcraildrive] at @s rotated as @s run tp @e[tag=rcrailseatb,limit=1,distance=..10] ^-1.5 ^5 ^
execute at @e[type=minecart,tag=rcraildrive] as @e[type=armor_stand,tag=rcrailanchor,limit=1,sort=nearest,distance=..10] store result score @s rcrailrot run data get entity @s Rotation[0]
execute as @e[type=minecart,tag=rcraildrive] store result score @s rcrailrot run data get entity @s Rotation[0]

execute as @e[type=minecart,tag=rcraildrive] at @s unless score @s rcrailrot = @e[type=armor_stand,tag=rcrailanchor,limit=1,sort=nearest,distance=..4] rcrailrot as @e[tag=rcrailcar,tag=!rcraildrive,distance=..10] run data modify entity @s Rotation[0] set from entity @e[type=minecart,tag=rcraildrive,limit=1,distance=..10] Rotation[0]
execute as @e[type=minecart,tag=rcraildrive] at @s run function projektredstoneworld:rcrailtransit/dospeedup