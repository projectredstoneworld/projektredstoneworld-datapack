#execute this as rcraildrive

tag @s add rcrailtodelete

execute at @s as @e[type=pig,tag=rcrailseat,limit=2,distance=..10] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,x=0,limit=1,sort=nearest,tag=rcrailtodelete] redstoneworldID run kill @s
execute at @s as @e[tag=rcrailcar,distance=..10] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,x=0,limit=1,sort=nearest,tag=rcrailtodelete] redstoneworldID run kill @s
execute at @s run kill @e[type=item,limit=2,distance=..10,nbt={Item:{id:"minecraft:saddle"}}]
kill @s
