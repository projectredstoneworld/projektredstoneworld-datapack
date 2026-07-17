# Distance squared in intermediate
execute store result score #rtcreactorintermediate info run data get entity @s Pos[0] 2
scoreboard players remove #rtcreactorintermediate info 227
scoreboard players operation #rtcreactorintermediate info *= #rtcreactorintermediate info
execute store result score #rtcreactorintermediate2 info run data get entity @s Pos[1] 2
scoreboard players remove #rtcreactorintermediate2 info 236
scoreboard players operation #rtcreactorintermediate2 info *= #rtcreactorintermediate2 info
scoreboard players operation #rtcreactorintermediate info += #rtcreactorintermediate2 info
execute store result score #rtcreactorintermediate2 info run data get entity @s Pos[2] 2
scoreboard players remove #rtcreactorintermediate2 info 1370
scoreboard players operation #rtcreactorintermediate2 info *= #rtcreactorintermediate2 info
scoreboard players operation #rtcreactorintermediate info += #rtcreactorintermediate2 info
# Prevent div0 + clamp distance
execute if score #rtcreactorintermediate info matches ..2000 run scoreboard players set #rtcreactorintermediate info 2000
scoreboard players operation #rtcreactorintermediate2 info = #rtcreactorspew info
scoreboard players operation #rtcreactorintermediate2 info /= #rtcreactorintermediate info

# Radiation suits
# 1 spew/sec = 0.01 mSv/s = 0.50 mSv/h
execute if entity @s[tag=radiationproof5] if score #rtcreactorintermediate2 info matches ..100 run scoreboard players set #rtcreactorintermediate2 info 0
execute if entity @s[tag=radiationproof6] if score #rtcreactorintermediate2 info matches ..120 run scoreboard players set #rtcreactorintermediate2 info 0
execute if entity @s[tag=radiationproof7] if score #rtcreactorintermediate2 info matches ..140 run scoreboard players set #rtcreactorintermediate2 info 0
execute if entity @s[tag=radiationproof20] if score #rtcreactorintermediate2 info matches ..400 run scoreboard players set #rtcreactorintermediate2 info 0
execute if entity @s[tag=radiationproofdev] run scoreboard players set #rtcreacrotintermediate2 info 0

# RTC bunker
execute if entity @s[x=-87,y=-8,z=610,dx=80,dy=8,dz=138] run scoreboard players operation #rtcreactorintermediate2 info /= 4 CONSTANTS
# FIB
execute if entity @s[x=-354,y=8,z=519,dx=170,dy=40,dz=180] run scoreboard players set #rtcreactorintermediate2 info 0
execute if entity @s[x=-307,y=1,z=567,dx=30,dy=40,dz=599] run scoreboard players set #rtcreactorintermediate2 info 0
# FGI rail
execute if entity @s[x=-338,y=1,z=488,dx=50,dy=22,dz=110] run scoreboard players set #rtcreactorintermediate2 info 0
execute if entity @s[x=-336,y=10,z=352,dx=10,dy=10,dz=210] run scoreboard players set #rtcreactorintermediate2 info 0


scoreboard players operation @s rtcrspew += #rtcreactorintermediate2 info
scoreboard players operation #rtcreactorintermediate info = @s rtcrspew
scoreboard players operation #rtcreactorintermediate info /= 100 CONSTANTS
scoreboard players operation @s radiationdose += #rtcreactorintermediate info
scoreboard players operation @s rtcrspew %= 100 CONSTANTS
