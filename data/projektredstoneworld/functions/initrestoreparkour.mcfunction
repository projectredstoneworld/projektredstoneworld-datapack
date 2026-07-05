# run as a random player trying to tp back to T0 modern from T0 - 2015
# Make sure no one else is currently getting restored
execute if entity @a[tag=restoretargetrtcm] run return fail
# make sure we can access the markers
forceload add -264 384 -264 364

tag @s add restoretargetrtcm

clear @s

execute as @e[type=marker,tag=rtcminv_store] if score @s redstoneworldID = @a[tag=restoretargetrtcm,limit=1] redstoneworldID run function projektredstoneworld:inventoryrestorertcm

tag @s remove restoretargetrtcm