execute in overworld run tag @a[tag=rcrailmsg] remove rcrailmsg
tag @a remove rcrailoneway
#Process all stations bounding boxes EXECUTE THIS IN OVERWORLD
execute as @a[x=-3457,y=95,z=-120,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=-2143,y=85,z=919,dx=12,dy=4,dz=2] run tag @s add rcrailmsg
execute as @a[x=-2110,y=73,z=174,dx=9,dy=4,dz=2] run tag @s add rcrailmsg
execute as @a[x=-1522,y=98,z=744,dx=2,dy=4,dz=13] run tag @s add rcrailmsg
execute as @a[x=-1344,y=87,z=-25,dx=9,dy=4,dz=2] run tag @s add rcrailmsg
execute as @a[x=-1033,y=71,z=729,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=-710,y=65,z=570,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=-668,y=74,z=914,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=-526,y=73,z=-88,dx=9,dy=4,dz=2] run tag @s add rcrailmsg
execute as @a[x=-369,y=68,z=375,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=-364,y=65,z=-1861,dx=6,dy=4,dz=2] run tag @s add rcrailmsg
execute as @a[x=-344,y=34,z=554,dx=6,dy=4,dz=6] run tag @s add rcrailmsg
execute as @a[x=-186,y=97,z=1173,dx=9,dy=4,dz=2] run tag @s add rcrailmsg
execute as @a[x=-44,y=69,z=20,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=-26,y=65,z=679,dx=32,dy=5,dz=11] run tag @s add rcrailmsg
execute as @a[x=446,y=69,z=122,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
execute as @a[x=2882,y=77,z=661,dx=2,dy=4,dz=9] run tag @s add rcrailmsg
# One way stations: Dos Village, SMP Base, Rakeport
execute as @a[x=-1522,y=98,z=744,dx=2,dy=4,dz=13] run tag @s add rcrailoneway
execute as @a[x=-1033,y=71,z=729,dx=2,dy=4,dz=9] run tag @s add rcrailoneway
execute as @a[x=-526,y=73,z=-88,dx=9,dy=4,dz=2] run tag @s add rcrailoneway

execute as @a[tag=rcrailmsg] unless score @s rcrailpay matches 1.. run tag @s remove rcrailmsg
execute as @a[tag=rcrailmsg,tag=!admin] if score #rcraildisable info matches 1 run tag @s remove rcrailmsg


execute as @a[tag=rcrailmsg,tag=!seenrcrailmsg] run tellraw @s ["",{"text":"R","bold":true,"color":"#FF0000"},{"text":"Corp","bold":true,"color":"red"},{"text":" Rail Network ","bold":true,"color":"dark_aqua"},{"text":"by Ij and Void","color":"aqua"},{"text":"\n"},{"text":"\n"},{"text":"Select a destination station by clicking the chat message!","bold":true,"color":"green"},{"text":"\n"},{"text":"Mobile Users! Use /trigger rcrailtrig set <ID> the ID number is next to destination name!","color":"gray"},{"text":"\n"},{"text":"\n"},{"text":"Redstone Theme Park (1)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 1"}},{"text":"\n"},{"text":"Redstone Cruise Ship (2)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 2"}},{"text":"\n"},{"text":"Dos Village (3)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 3"}},{"text":"\n"},{"text":"Main Redstone Bunker (4)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 4"}},{"text":"\n"},{"text":"Dos SMP Base (5)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 5"}},{"text":"\n"},{"text":"Gerudo Desert (6)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 6"}},{"text":"\n"},{"text":"Redstone Villa (7)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 7"}},{"text":"\n"},{"text":"Blakewood Travel (8)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 8"}},{"text":"\n"},{"text":"Founding Island - Spawn (9)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 9"}},{"text":"\n"},{"text":"Founding Island - Bunker (10)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 10"}},{"text":"\n"},{"text":"Tavish Town (11)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 11"}},{"text":"\n"},{"text":"Redstone Tower Complex - Global Control (12)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 12"}},{"text":"\n"},{"text":"Redstone Tower Complex - Tower 3.0 (13)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 13"}},{"text":"\n"},{"text":"Eastern Village (14)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 14"}}]

execute as @a[tag=rcrailmsg,tag=!seenrcrailmsg,scores={rcorpsec=2..}] run tellraw @s ["",{"text":"Due to your RCorp Clearance, you have access to 3 extra stations","color":"gray"},{"text":"\n"},{"text":"Testing Sector (15)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 15"}},{"text":"\n"},{"text":"Site Omega-5 (16)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 16"}},{"text":"\n"},{"text":"Blakewood Forest (17)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 17"}},{"text":"\n"}]

scoreboard players reset @a[tag=!seenrcrailmsg] rcsid
tag @a[tag=rcrailmsg] add seenrcrailmsg
tag @a[tag=!rcrailmsg] remove seenrcrailmsg
scoreboard players reset @a[tag=!rcrailmsg,tag=!rcrailrider] rcrailtrig

scoreboard players enable @a[tag=seenrcrailmsg] rcrailtrig

execute as @a[tag=seenrcrailmsg,scores={rcrailtrig=1..},tag=!rcrailpasstrig1,tag=!rcraildirwait,tag=!rcrailpass2,tag=!rcrailpass3] at @s run function projektredstoneworld:rcrailtransit/handletrig1

execute as @a[tag=seenrcrailmsg,tag=rcrailpasstrig1,tag=!rcrailoneway] run tellraw @s ["",{"text":"R","bold":true,"color":"#FF0000"},{"text":"Corp","bold":true,"color":"red"},{"text":" Rail Network ","bold":true,"color":"dark_aqua"},{"text":"by Ij and Void","color":"aqua"},{"text":"\n"},{"text":"\n"},{"text":"Your current station requires a depart direction to proceed, please click one.","bold":true,"color":"green"},{"text":"\n"},{"text":"Mobile Users! Use /trigger rcrailtrig set <ID> the ID number is next to direction name!","color":"gray"},{"text":"\n"},{"text":"\n"},{"text":"Northbound/Westbound (18)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 18"}},{"text":"\n"},{"text":"Southbound/Eastbound (19)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 19"}}]
tellraw @a[tag=seenrcrailmsg,tag=rcrailpasstrig1,tag=rcrailoneway,tag=!rcrailpass2] {"text":"Your train is spawning shortly! You may have to wait for any already present trains to depart first.","color":"green"}
tag @a[tag=seenrcrailmsg,tag=rcrailpasstrig1,tag=rcrailoneway] add rcrailpass2
tag @a[tag=seenrcrailmsg,tag=rcrailpasstrig1,tag=rcrailoneway] add rcrailneg
tag @a[tag=seenrcrailmsg,tag=rcrailpasstrig1,tag=!rcrailoneway] add rcraildirwait
tag @a[tag=rcrailpasstrig1] remove rcrailpasstrig1
execute as @a[tag=seenrcrailmsg,tag=rcraildirwait] if score @s rcrailtrig matches 18 run tag @s add rcrailneg
execute as @a[tag=seenrcrailmsg,tag=rcraildirwait] if score @s rcrailtrig matches 19 run tag @s add rcrailpos
execute as @a[tag=seenrcrailmsg,tag=rcraildirwait] if score @s rcrailtrig matches 18..19 run tag @s add rcrailpass2
execute as @a[tag=seenrcrailmsg,tag=rcraildirwait] if score @s rcrailtrig matches 18..19 run scoreboard players reset @s rcrailtrig
tellraw @a[tag=seenrcrailmsg,tag=rcraildirwait,tag=rcrailpass2] {"text":"Your train is spawning shortly! You may have to wait for any already present trains to depart first.","color":"green"}
execute as @a[tag=seenrcrailmsg,tag=rcraildirwait,tag=rcrailpass2] run tag @s remove rcraildirwait
tag @a[tag=rcraildirwait,tag=!seenrcrailmsg] remove rcraildirwait
#Handoff to station
execute as @a[tag=seenrcrailmsg,tag=rcrailpass2] at @s at @e[type=marker,distance=..20,tag=rcsmanager,limit=1,sort=nearest] run function projektredstoneworld:rcrailtransit/tryhandoff
#execute as @a[tag=seenrcrailmsg,tag=rcrailpass2,tag=rcrailpass3] run tellraw @s {"text":"Your train is spawning shortly! Please wait at the station platform and prepare for departure.","color":"green"}
tag @a[tag=seenrcrailmsg,tag=rcrailpass3] remove rcrailpass2

# Pass 3 means it's all on me! yes ij the blacks are all on you
# Primary gets removed after leaving the station, prompt front seat / only rider for switching station, re-prompt at arrival to station

execute in overworld as @e[type=marker,x=0,tag=rcsneg] at @s if entity @e[type=minecart,tag=rcraildrive,distance=..1,tag=!rcrailaged] unless entity @a[tag=rcrailpass3,tag=rcrailneg,limit=1,sort=nearest,distance=..32] as @e[type=minecart,tag=rcraildrive,distance=..1,tag=!rcrailaged] run function projektredstoneworld:rcrailtransit/killrcrailcar
execute in overworld as @e[type=marker,x=0,tag=rcspos] at @s if entity @e[type=minecart,tag=rcraildrive,distance=..1,tag=!rcrailaged] unless entity @a[tag=rcrailpass3,tag=rcrailpos,limit=1,sort=nearest,distance=..32] as @e[type=minecart,tag=rcraildrive,distance=..1,tag=!rcrailaged] run function projektredstoneworld:rcrailtransit/killrcrailcar

# close doors here

# send off
execute in overworld as @e[type=marker,x=0,tag=rcsneg] at @s if entity @e[type=minecart,tag=rcraildrive,distance=..1] if score @a[tag=rcrailpass3,tag=rcrailneg,limit=1,sort=nearest,distance=..10] redstoneworldID = @s redstoneworldID as @a[tag=rcrailpass3,tag=rcrailneg,limit=1,sort=nearest,distance=..10] on vehicle if entity @s[type=pig,tag=rcrailseat] as @e[type=marker,tag=rcsneg,limit=1,sort=nearest,distance=..10] at @s run function projektredstoneworld:rcrailtransit/handlepowerdepart
execute in overworld as @e[type=marker,x=0,tag=rcspos] at @s if entity @e[type=minecart,tag=rcraildrive,distance=..1] if score @a[tag=rcrailpass3,tag=rcrailpos,limit=1,sort=nearest,distance=..10] redstoneworldID = @s redstoneworldID as @a[tag=rcrailpass3,tag=rcrailpos,limit=1,sort=nearest,distance=..10] on vehicle if entity @s[type=pig,tag=rcrailseat] as @e[type=marker,tag=rcspos,limit=1,sort=nearest,distance=..10] at @s run function projektredstoneworld:rcrailtransit/handlepowerdepart

# Skibidi toilet oh fuck it's on the car that's why I gooned pls help I can't control the SEMEN! INTO THE STEERING WHEEL HE GOES! AHHHHHH IT'S GRIPPY!

execute in overworld as @a[tag=rcrailneg,x=0] at @s unless entity @e[type=marker,tag=rcsneg,distance=..32] run tag @s remove rcrailneg
execute in overworld as @a[tag=rcrailpos,x=0] at @s unless entity @e[type=marker,tag=rcspos,distance=..32] run tag @s remove rcrailpos
execute in overworld as @a[tag=rcrailpass3,x=0] at @s unless entity @e[type=marker,tag=rcsmanager,distance=..32] run tag @s remove rcrailpass3

scoreboard players enable @a[tag=rcrailrider] rcrailtrig
execute in overworld as @a[tag=rcrailrider,x=0,scores={rcrailtrig=-1}] run tellraw @s ["",{"text":"R","bold":true,"color":"#FF0000"},{"text":"Corp","bold":true,"color":"red"},{"text":" Rail Network ","bold":true,"color":"dark_aqua"},{"text":"by Ij and Void","color":"aqua"},{"text":"\n"},{"text":"\n"},{"text":"Select a destination station by clicking the chat message!","bold":true,"color":"green"},{"text":"\n"},{"text":"Mobile Users! Use /trigger rcrailtrig set <ID> the ID number is next to destination name!","color":"gray"},{"text":"\n"},{"text":"\n"},{"text":"Redstone Theme Park (1)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 1"}},{"text":"\n"},{"text":"Redstone Cruise Ship (2)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 2"}},{"text":"\n"},{"text":"Dos Village (3)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 3"}},{"text":"\n"},{"text":"Main Redstone Bunker (4)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 4"}},{"text":"\n"},{"text":"Dos SMP Base (5)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 5"}},{"text":"\n"},{"text":"Gerudo Desert (6)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 6"}},{"text":"\n"},{"text":"Redstone Villa (7)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 7"}},{"text":"\n"},{"text":"Blakewood Travel (8)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 8"}},{"text":"\n"},{"text":"Founding Island - Spawn (9)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 9"}},{"text":"\n"},{"text":"Founding Island - Bunker (10)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 10"}},{"text":"\n"},{"text":"Tavish Town (11)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 11"}},{"text":"\n"},{"text":"Redstone Tower Complex - Global Control (12)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 12"}},{"text":"\n"},{"text":"Redstone Tower Complex - Tower 3.0 (13)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 13"}},{"text":"\n"},{"text":"Eastern Village (14)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 14"}}]
execute in overworld as @a[tag=rcrailrider,x=0,scores={rcrailtrig=-1,rcorpsec=2..}] run tellraw @s ["",{"text":"Due to your RCorp Clearance, you have access to 3 extra stations","color":"gray"},{"text":"\n"},{"text":"Testing Sector (15)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 15"}},{"text":"\n"},{"text":"Site Omega-5 (16)","bold":true,"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 16"}},{"text":"\n"},{"text":"Blakewood Forest (17)","bold":true,"color":"red","clickEvent":{"action":"run_command","value":"/trigger rcrailtrig set 17"}},{"text":"\n"}]
execute in overworld as @a[tag=rcrailrider,x=0,scores={rcrailtrig=-1}] run scoreboard players reset @s rcrailtrig

execute in overworld as @e[tag=rcrailrider,x=0,scores={rcrailtrig=1..}] at @s run function projektredstoneworld:rcrailtransit/handletrig2
