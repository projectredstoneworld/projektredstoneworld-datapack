# Fail if no loaded stations
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,limit=1,sort=random] at @s unless loaded ~ ~ ~ run return fail
execute in overworld unless entity @e[type=marker,tag=rcsmanager,x=0] run return fail