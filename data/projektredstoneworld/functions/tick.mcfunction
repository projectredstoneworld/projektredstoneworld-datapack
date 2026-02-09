function projektredstoneworld:handleid
function projektredstoneworld:totem
#execute as @e[type=armor_stand,tag=novisname] run data remove entity @s CustomNameVisible
#execute as @e[tag=rcrailseat] at @s run data modify entity @s Motion set from entity @e[type=minecart,tag=rcraildrive,limit=1,sort=nearest,distance=..10] Motion
