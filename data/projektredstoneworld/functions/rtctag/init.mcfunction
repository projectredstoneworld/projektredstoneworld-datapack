execute if score #tagstatus info matches 0 run tellraw @a [{"text":"[Tag] ","bold":true,"color":"#FF0055"},{"text":"The game has been cancelled","bold":false,"color":"#FF0055"}]
execute if score #tagstatus info matches 0 run function projektredstoneworld:rtctag/end
execute if score #tagstatus info matches 2..3 run tellraw @a [{"text":"[Tag] ","bold":true,"color":"#FF0055"},{"text":"The game has already started","bold":false,"color":"#FF0055"}]
execute unless score #tagstatus info matches 1 run return fail

# Runs when head start begins

scoreboard players set #tagstatus info 2
scoreboard players operation #tagtimer info = #taghead info
execute if score #taghead info matches 10.. run scoreboard players operation #tagtimer info *= 1000 CONSTANTS
execute if score #taghead info matches ..9 run scoreboard players operation #tagtimer info *= 60000 CONSTANTS
scoreboard players set #tagchasecmax info 0
bossbar set tagtimer visible true
bossbar set tagtimer players @a[tag=pontoka]
bossbar set tagtimer color yellow
execute store result bossbar tagtimer max run scoreboard players get #tagtimer info

# Activate psudo to disable /spawn and such
setblock 298 5 666 minecraft:redstone_block

tellraw @a [{"text":"[Tag] ","bold":true,"color":"#FF0055"},{"text":"The runners have spawned in the auction house! The head start has begun","bold":false}]

execute in minecraft:overworld run tp @a[tag=pontokarun] -12.5 141.0 669.5 -180 0
clear @a[tag=pontokarun]

scoreboard objectives add tagdeathrip deathCount

setblock 287 8 669 pink_stained_glass
setblock 286 8 669 redstone_block

function projektredstoneworld:rtctag/tagschedule
