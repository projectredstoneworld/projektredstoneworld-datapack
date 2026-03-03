execute in overworld run tag @e[tag=rcsmanager,x=0,tag=chosenRCS] remove chosenRCS

# Fail if no loaded stations, first statement there may be a bit redundant or useless
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,limit=1,sort=random] at @s unless loaded ~ ~ ~ run return fail
execute in overworld unless entity @e[type=marker,tag=rcsmanager,x=0] run return fail


# Pick random loaded station to depart from
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,limit=1,sort=random] at @s if loaded ~ ~ ~ run tag @s add chosenRCS

# Choose a side
execute store result score #rcrailghostpodside info run random value 0..1

# If no pos force negative, since that's used in oneway stations
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s unless entity @e[type=marker,distance=..15,tag=rcspos] run scoreboard players set #rcrailghostpodside info 0

# Fail if chosen side has a pod in the way
execute if score #rcrailghostpodside info matches 0 in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s at @e[type=marker,distance=..15,tag=rcsneg] if entity @e[tag=rcraildrive,distance=..1,type=minecart] run return fail
execute if score #rcrailghostpodside info matches 1 in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s at @e[type=marker,distance=..15,tag=rcspos] if entity @e[tag=rcraildrive,distance=..1,type=minecart] run return fail

# If it has made it this far we are good to go
scoreboard players set #rcrailsghost info 1
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s if score #rcrailghostpodside info matches 0 at @e[type=marker,distance=..15,tag=rcsneg] run function projektredstoneworld:spawncarrcrail
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s if score #rcrailghostpodside info matches 1 at @e[type=marker,distance=..15,tag=rcspos] run function projektredstoneworld:spawncarrcrail

# Update random value range if new stations are added
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s as @e[type=minecart,distance=..15,tag=rcraildrive,tag=rcrailghost] store result score @s rcsid run random value 0..16
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s as @e[type=minecart,distance=..15,tag=rcraildrive,tag=rcrailghost] run function projektredstoneworld:rcrailtransit/applycoords

execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s as @e[type=minecart,distance=..15,tag=rcraildrive,tag=rcrailghost] at @s as @e[type=marker,tag=rcsneg,distance=..2] at @s run function projektredstoneworld:rcrailtransit/handlepowerdepart
execute in overworld as @e[type=marker,tag=rcsmanager,x=0,tag=chosenRCS] at @s as @e[type=minecart,distance=..15,tag=rcraildrive,tag=rcrailghost] at @s as @e[type=marker,tag=rcspos,distance=..2] at @s run function projektredstoneworld:rcrailtransit/handlepowerdepart

scoreboard players set #rcrailghostpodtime info 0