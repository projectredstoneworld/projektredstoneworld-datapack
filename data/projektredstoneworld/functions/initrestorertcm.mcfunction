# run as a random player trying to tp back to T3.0 from RTCM
# Make sure no one else is currently getting restored
execute if entity @a[tag=restoretargetrtcm] run return fail
# make sure we can access the markers
forceload add -264 384 -264 364

tag @s add restoretargetrtcm
tag @s remove rtcm
clear @s

execute as @e[type=marker,tag=rtcminv_store] if score @s redstoneworldID = @a[tag=restoretargetrtcm,limit=1] redstoneworldID run function projektredstoneworld:inventoryrestorertcm

tp @s ~-290 ~274 ~30

tag @s remove restoretargetrtcm

execute as @a[x=296,y=2,z=652,dx=5,dy=10,dz=6,gamemode=!spectator,limit=1,sort=random] at @s run function projektredstoneworld:initrestorertcm