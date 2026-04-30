# ==== STABILITY CALCULATION ====
scoreboard players set #rtcreactorstability info 97
# iodine delta
scoreboard players operation #rtcreactorintermediate info = #rtcreactoriodine info
scoreboard players operation #rtcreactorintermediate info -= #rtcreactoriodinep info
scoreboard players operation #rtcreactoriodinep info = #rtcreactoriodine info
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorintermediate info *= -1 CONSTANTS
execute if score #rtcreactorintermediate info matches 0 run scoreboard players add #rtcreactorstability info 1
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
execute if score #rtcreactorintermediate info matches ..-24 run scoreboard players set #rtcreactorintermediate info -24
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info
# water pressure delta
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players operation #rtcreactorintermediate info -= #rtcreactorwaterpressurep info
scoreboard players operation #rtcreactorwaterpressurep info = #rtcreactorwaterpressure info
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorintermediate info *= -1 CONSTANTS
execute if score #rtcreactorintermediate info matches 0 run scoreboard players add #rtcreactorstability info 1
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
execute if score #rtcreactorintermediate info matches ..-24 run scoreboard players set #rtcreactorintermediate info -24
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info
# xenon delta
scoreboard players operation #rtcreactorintermediate info = #rtcreactorxenon info
scoreboard players operation #rtcreactorintermediate info -= #rtcreactorxenonp info
scoreboard players operation #rtcreactorxenonp info = #rtcreactorxenon info
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players operation #rtcreactorintermediate info *= -1 CONSTANTS
execute if score #rtcreactorintermediate info matches 0 run scoreboard players add #rtcreactorstability info 1
scoreboard players operation #rtcreactorintermediate info /= 50 CONSTANTS
execute if score #rtcreactorintermediate info matches ..-12 run scoreboard players set #rtcreactorintermediate info -12
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info
# if water pressure >19000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players remove #rtcreactorintermediate info 19000
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 40 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info

# if water pressure <14000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorwaterpressure info
scoreboard players remove #rtcreactorintermediate info 14000
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info

# if xenon >7000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorxenon info
scoreboard players remove #rtcreactorintermediate info 7000
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 100 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info

# if xenon <3000 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorxenon info
scoreboard players remove #rtcreactorintermediate info 3000
execute if score #rtcreactorintermediate info matches 0.. run scoreboard players set #rtcreactorintermediate info 0
execute if score #rtcreactorcoretemp info matches ..250 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 100 CONSTANTS
scoreboard players operation #rtcreactorstability info += #rtcreactorintermediate info

# if core temperature >400 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorcoretemp info
scoreboard players remove #rtcreactorintermediate info 400
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 2 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info
tellraw @a [{"text":"my ass g irlfrifnd named TEMPERATEURE OF MY ANUS pregnant"},{"score":{"name":"#rtcreactorstability","objective":"info"}}]

# if turbine power >1700 remove stability
scoreboard players operation #rtcreactorintermediate info = #rtcreactorturbinepower info
scoreboard players remove #rtcreactorintermediate info 1700
execute if score #rtcreactorintermediate info matches ..0 run scoreboard players set #rtcreactorintermediate info 0
scoreboard players operation #rtcreactorintermediate info /= 24 CONSTANTS
scoreboard players operation #rtcreactorstability info -= #rtcreactorintermediate info
tellraw @a [{"text":"my ass g irlfrifnd named AHHHHHHHHH GEORGE BUSH DJ VANCE TROOMP pregnant"},{"score":{"name":"#rtcreactorstability","objective":"info"}}]

# final clamping
execute if score #rtcreactorstability info matches ..0 run scoreboard players set #rtcreactorstability info 0
# reward sound for reaching 100
execute if score #rtcreactorstability info matches 100 if score #rtcreactorstable info matches 0 run playsound minecraft:block.beacon.ambient master @a[tag=inrtcreactor] ~ ~ ~ 1 2 1
execute if score #rtcreactorstability info matches 100 if score #rtcreactorstable info matches 0 run tellraw @a[tag=inrtcreactor] [{"text":"THE REACTOR JUST STABILIZED","bold":true,"color":"#00FF00"}]
execute if score #rtcreactorstability info matches 100 run scoreboard players set #rtcreactorstable info 1
execute unless score #rtcreactorstability info matches 100 run scoreboard players set #rtcreactorstable info 0
