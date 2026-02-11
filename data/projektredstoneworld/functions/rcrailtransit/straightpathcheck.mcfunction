scoreboard players set @s rcrailcartstraight 0

# INIT --------------------
# Summon marker and tp to conserve rotation
summon marker ~ ~ ~ {Tags:["rcrstraightpathcheckmarker"],data:{x:0,y:0,z:0}}

# X/Z motion integers, -1 is negative, 0 for no motion, 1 for positive
execute store result score @s rcrailcartstraightx run data get entity @s Motion[0] 1000
execute if score @s rcrailcartstraightx matches ..-1 run scoreboard players set @s rcrailcartstraightx -1
execute if score @s rcrailcartstraightx matches 1.. run scoreboard players set @s rcrailcartstraightx 1
execute store result score @s rcrailcartstraightz run data get entity @s Motion[2] 1000
execute if score @s rcrailcartstraightz matches ..-1 run scoreboard players set @s rcrailcartstraightz -1
execute if score @s rcrailcartstraightz matches 1.. run scoreboard players set @s rcrailcartstraightz 1

execute if score @s rcrailcartstraightx matches 0 if score @s rcrailcartstraightz matches 0 run return fail

# Store into marker
execute store result entity @e[type=marker,distance=..1,tag=rcrstraightpathcheckmarker,limit=1,sort=nearest] data.x int 1 run scoreboard players get @s rcrailcartstraightx
execute store result entity @e[type=marker,distance=..1,tag=rcrstraightpathcheckmarker,limit=1,sort=nearest] data.z int 1 run scoreboard players get @s rcrailcartstraightz

tag @s add minecartgayrcrail

execute as @e[type=marker,distance=..1,tag=rcrstraightpathcheckmarker,limit=1,sort=nearest] at @s run function projektredstoneworld:rcrailtransit/straightpathcheckloop
