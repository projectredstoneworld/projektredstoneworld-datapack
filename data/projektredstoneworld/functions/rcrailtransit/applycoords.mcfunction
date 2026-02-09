#This should be ran by the RCorp Rail minecart, tag rcraildrive
#First file in the rcrailtransit folder, this will include the functions that handle the later part of rcrail development, I put earlier functions just in the root folder

#Testing Sector
execute if score @s rcsid matches 0 run scoreboard players set @s rcsx 0
execute if score @s rcsid matches 0 run scoreboard players set @s rcsz 1

#Theme Park
execute if score @s rcsid matches 1 run scoreboard players set @s rcsx 1
execute if score @s rcsid matches 1 run scoreboard players set @s rcsz 14

#Cruise Ship
execute if score @s rcsid matches 2 run scoreboard players set @s rcsx 2
execute if score @s rcsid matches 2 run scoreboard players set @s rcsz 6

#Dos Village
execute if score @s rcsid matches 3 run scoreboard players set @s rcsx 3
execute if score @s rcsid matches 3 run scoreboard players set @s rcsz 13

#Main Bunker
execute if score @s rcsid matches 4 run scoreboard players set @s rcsx 4
execute if score @s rcsid matches 4 run scoreboard players set @s rcsz 3

#SMP Base (Dos)
execute if score @s rcsid matches 5 run scoreboard players set @s rcsx 5
execute if score @s rcsid matches 5 run scoreboard players set @s rcsz 12

#Gerudo Desert
execute if score @s rcsid matches 6 run scoreboard players set @s rcsx 6
execute if score @s rcsid matches 6 run scoreboard players set @s rcsz 9

#Villa
execute if score @s rcsid matches 7 run scoreboard players set @s rcsx 7
execute if score @s rcsid matches 7 run scoreboard players set @s rcsz 14

#Rakeport
execute if score @s rcsid matches 8 run scoreboard players set @s rcsx 8
execute if score @s rcsid matches 8 run scoreboard players set @s rcsz 2

#Founding Island - Spawn
execute if score @s rcsid matches 9 run scoreboard players set @s rcsx 9
execute if score @s rcsid matches 9 run scoreboard players set @s rcsz 7

#Forgotten Isle
execute if score @s rcsid matches 10 run scoreboard players set @s rcsx 9
execute if score @s rcsid matches 10 run scoreboard players set @s rcsz 0

#FI Bunker
execute if score @s rcsid matches 11 run scoreboard players set @s rcsx 10
execute if score @s rcsid matches 11 run scoreboard players set @s rcsz 8

#Tavish Town
execute if score @s rcsid matches 12 run scoreboard players set @s rcsx 11
execute if score @s rcsid matches 12 run scoreboard players set @s rcsz 15

#Global Control / Founding Desert
execute if score @s rcsid matches 13 run scoreboard players set @s rcsx 12
execute if score @s rcsid matches 13 run scoreboard players set @s rcsz 4

#RTC-2 / Tower 3.0
execute if score @s rcsid matches 14 run scoreboard players set @s rcsx 13
execute if score @s rcsid matches 14 run scoreboard players set @s rcsz 11

#Eastern Village
execute if score @s rcsid matches 15 run scoreboard players set @s rcsx 14
execute if score @s rcsid matches 15 run scoreboard players set @s rcsz 5
#Blakewood Outpost
execute if score @s rcsid matches 16 run scoreboard players set @s rcsx 15
execute if score @s rcsid matches 16 run scoreboard players set @s rcsz 10