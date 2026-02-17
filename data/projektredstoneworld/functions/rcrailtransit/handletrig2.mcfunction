execute at @s run scoreboard players operation @s rcsid = @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] rcsid

# Assign station IDs
execute if score @s rcrailtrig matches 1 run scoreboard players set @s rcsid 1
execute if score @s rcrailtrig matches 2 run scoreboard players set @s rcsid 2
execute if score @s rcrailtrig matches 3 run scoreboard players set @s rcsid 3
execute if score @s rcrailtrig matches 4 run scoreboard players set @s rcsid 4
execute if score @s rcrailtrig matches 5 run scoreboard players set @s rcsid 5
execute if score @s rcrailtrig matches 6 run scoreboard players set @s rcsid 6
execute if score @s rcrailtrig matches 7 run scoreboard players set @s rcsid 7
execute if score @s rcrailtrig matches 8 run scoreboard players set @s rcsid 8
execute if score @s rcrailtrig matches 9 run scoreboard players set @s rcsid 9
execute if score @s rcrailtrig matches 10 run scoreboard players set @s rcsid 11
execute if score @s rcrailtrig matches 11 run scoreboard players set @s rcsid 12
execute if score @s rcrailtrig matches 12 run scoreboard players set @s rcsid 13
execute if score @s rcrailtrig matches 13 run scoreboard players set @s rcsid 14
execute if score @s rcrailtrig matches 14 run scoreboard players set @s rcsid 15
execute if score @s rcrailtrig matches 15 if score @s rcorpsec matches 2.. run scoreboard players set @s rcsid 0
execute if score @s rcrailtrig matches 16 if score @s rcorpsec matches 2.. run scoreboard players set @s rcsid 10
execute if score @s rcrailtrig matches 17 if score @s rcorpsec matches 2.. run scoreboard players set @s rcsid 16

# Update destination
execute unless score @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] rcsid = @s rcsid run tellraw @s {"text":"Destination successfully updated!","color":"green"}
execute at @s run scoreboard players operation @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] rcsid = @s rcsid
execute as @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] run function projektredstoneworld:rcrailtransit/applycoords

execute as @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] at @s if entity @s[tag=rcrailarrive] as @e[type=marker,tag=rcsneg,distance=..1,limit=1] run function projektredstoneworld:rcrailtransit/handlepowerdepart
execute as @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] at @s if entity @s[tag=rcrailarrive] as @e[type=marker,tag=rcspos,distance=..1,limit=1] run function projektredstoneworld:rcrailtransit/handlepowerdepart
execute as @e[type=minecart,tag=rcraildrive,distance=..12,limit=1,sort=nearest] at @s if entity @s[tag=rcrailarrive] run tag @s remove rcrailarrive

scoreboard players reset @s rcrailtrig
