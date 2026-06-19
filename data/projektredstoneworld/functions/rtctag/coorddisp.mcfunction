# Execute as tag players

scoreboard players set #tagpnearby info 0
execute if entity @s[tag=pontokarun] at @s run tag @a[tag=pontokachase,limit=1,sort=nearest] add pontokanear
execute if entity @s[tag=pontokachase] at @s run tag @a[tag=pontokarun,limit=1,sort=nearest] add pontokanear
execute if entity @a[tag=pontokanear,distance=..100] run scoreboard players set #tagpnearby info 1
tag @a remove pontokanear

execute store result score #nearx tagcoords run data get entity @a[tag=pontokarun,limit=1] Pos[0]
execute store result score #neary tagcoords run data get entity @a[tag=pontokarun,limit=1] Pos[1]
execute store result score #nearz tagcoords run data get entity @a[tag=pontokarun,limit=1] Pos[2]

execute if score #tagpnearby info matches 0 run function projektredstoneworld:rtctag/coorddispfar
execute if score #tagpnearby info matches 1 run function projektredstoneworld:rtctag/coorddispnear
