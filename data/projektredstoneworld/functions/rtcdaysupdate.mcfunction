forceload add -29 622 -29 630
summon marker -31 148 632 {Tags:["rtcdayskibidi"]}

fill -31 150 610 -31 146 633 minecraft:black_concrete replace minecraft:redstone_block
fill -32 150 610 -32 146 633 minecraft:redstone_lamp replace minecraft:redstone_lamp

scoreboard players operation #ifeelsogay info = #ones info
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 4..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..4 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 7..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 2..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 2 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..1 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 3..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block

execute as @e[type=marker,tag=rtcdayskibidi] at @s run tp ~ ~ ~-4
scoreboard players operation #ifeelsogay info = #tens info
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 4..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..4 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 7..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 2..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 2 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..1 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 3..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block

execute as @e[type=marker,tag=rtcdayskibidi] at @s run tp ~ ~ ~-4
scoreboard players operation #ifeelsogay info = #hundreds info
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 4..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..4 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 7..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 2..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 2 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..1 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 3..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block

execute as @e[type=marker,tag=rtcdayskibidi] at @s run tp ~ ~ ~-5
scoreboard players operation #ifeelsogay info = #thousands info
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 4..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..4 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 7..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 2..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 2 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..1 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 3..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block

execute as @e[type=marker,tag=rtcdayskibidi] at @s run tp ~ ~ ~-4
scoreboard players operation #ifeelsogay info = #tenthousands info
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 4..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..4 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 7..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 2..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 2 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..1 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 3..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block

execute as @e[type=marker,tag=rtcdayskibidi] at @s run tp ~ ~ ~-4
scoreboard players operation #ifeelsogay info = #hundredthousands info
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~2 ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 4..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..4 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 7..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 2..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~ ~-1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 2 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~ ~-1 redstone_block
execute if score #ifeelsogay info matches 0..1 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 3..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~1 ~ ~ ~1 redstone_block
execute if score #ifeelsogay info matches 0 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 2..3 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 5..6 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block
execute if score #ifeelsogay info matches 8..9 at @e[type=marker,tag=rtcdayskibidi] run fill ~ ~-2 ~-1 ~ ~-2 ~1 redstone_block

kill @e[type=marker,tag=rtcdayskibidi]
forceload remove -29 622 -29 630
