# Runs when the head start ends

scoreboard players set #tagstatus info 3
scoreboard players operation #tagtimer info = #tagtime info
scoreboard players operation #tagtimer info *= 60000 CONSTANTS
scoreboard players set #taglowtime info 0

bossbar set tagtimer color red
execute store result bossbar tagtimer max run scoreboard players get #tagtimer info

tellraw @a [{"text":"[Tag] ","bold":true,"color":"#FF0055"},{"text":"The chasers have spawned in the auction house! The game has started","bold":false}]

execute in minecraft:overworld run tp @a[tag=pontokachase] -12.5 141.0 669.5 -180 0

setblock 286 6 669 pink_stained_glass
setblock 285 6 669 redstone_block
