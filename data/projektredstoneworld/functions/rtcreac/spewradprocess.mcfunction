# Distance squared in intermediate
execute store result score #rtcreactorintermediate info run data get entity @s Pos[0] 2
scoreboard players remove #rtcreactorintermediate info 227
scoreboard players operation #rtcreactorintermediate info *= #rtcreactorintermediate info
execute store result score #rtcreactorintermediate2 info run data get entity @s Pos[1] 2
scoreboard players remove #rtcreactorintermediate2 info 236
scoreboard players operation #rtcreactorintermediate2 info *= #rtcreactorintermediate info
scoreboard players operation #rtcreactorintermediate info += #rtcreactorintermediate2 info
execute store result score #rtcreactorintermediate2 info run data get entity @s Pos[2] 2
scoreboard players remove #rtcreactorintermediate2 info 1370
scoreboard players operation #rtcreactorintermediate2 info *= #rtcreactorintermediate info
scoreboard players operation #rtcreactorintermediate info += #rtcreactorintermediate2 info
# Prevent div0 + clamp distance
execute if score #rtcreactorintermediate info matches ..2000 run scoreboard players set #rtcreactorintermediate info 2000
scoreboard players operation #rtcreactorintermediate2 info = #rtcreactorspew info
scoreboard players operation #rtcreactorintermediate2 info /= #rtcreactorintermediate info
scoreboard players operation @s rtcrspew += #rtcreactorintermediate info
scoreboard players operation #rtcreactorintermediate info = @s rtcrspew
scoreboard players operation #rtcreactorintermediate info /= 100 CONSTANTS
scoreboard players operation @s radiationdose += #rtcreactorintermediate info
scoreboard players operation @s rtcrspew %= 100 CONSTANTS
