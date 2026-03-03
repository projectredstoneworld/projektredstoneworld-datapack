schedule function projektredstoneworld:rcrailtransit/rcrailrottick 3t

execute in overworld run tag @e[tag=rcraildrive,type=minecart,x=0] remove handledPodRotation
execute in overworld as @e[tag=rcraildrive,type=minecart,x=0,tag=!handledPodRotation,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/podrotation