#execute this as rcraildrive

tag @s add rcrailtodelete

execute at @s as @e[type=pig,tag=rcrailseat,limit=2,distance=..10] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,x=0,limit=1] redstoneworldID run kill @s
execute at @s as @e[tag=rcrailcar,distance=..10] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,x=0,limit=1] redstoneworldID run kill @s
kill @s
