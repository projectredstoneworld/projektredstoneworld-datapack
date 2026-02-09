#placeholder because we don't want to match station to 0 by accident
scoreboard players set @s rcsid 255
#Assign station IDs
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
#18 and 19 are reserved for player choosing direction, so for any future stations start at 20 for rcrailtrig, rcsid 17
execute if score @s rcsid matches 255 run tellraw @s {"text":"Error: Invalid or Restricted Station ID. Please try again later.","color":"red"}
scoreboard players reset @s rcrailtrig
execute if score @s rcsid matches 0..254 run tag @s add rcrailpasstrig1
tellraw @a[tag=rcrailpasstrig1] {"text":"Station Selected! Please wait while RCorp Rail process your request, you may be asked to choose a direction.","color":"green"}