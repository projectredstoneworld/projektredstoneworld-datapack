# Run as player in limbo

# Make sure the player is in limbo!!
execute in overworld unless entity @s[x=90,y=-67,z=390,dx=80,dy=26,dz=263] run return fail

kill @e[type=marker,tag=limboentitytest]
execute at @s run summon marker ~ ~ ~ {Tags:["limboentitytest"]}
# Get player rotation to nearest 90 degrees
execute store result score #rtcreactorintermediate info run data get entity @s Rotation[0] 0.022222222222
scoreboard players add #rtcreactorintermediate info 1
scoreboard players operation #rtcreactorintermediate info /= 2 CONSTANTS
scoreboard players operation #rtcreactorintermediate info *= 90 CONSTANTS
execute store result entity @e[tag=limboentitytest,limit=1] data.rot float 1 run scoreboard players get #rtcreactorintermediate info
# 20% chance of spawning in front of player
execute store result entity @e[tag=limboentitytest,limit=1] data.fwd int 1 run random value 1..5
# Begin checking that spawn location is valid
execute as @e[type=marker,tag=limboentitytest] run function projektredstoneworld:rtcreac/limboeffects/spawnentitystartcheck with entity @s data
# Intermediate 2 is 0 if check succeeds
tellraw @s [{"text":"Scary entity spawn check: "}, {"score":{"name":"#rtcreactorintermediate2","objective":"info"}}]
# TODO: Add jumpscare if entity is unable to spawn, and spawn the actual entity itself

# Pick random entity
execute store result score #rtcreactorintermediate info run random value 1..2
# Spawn entities. Summon command imported from data in /data get entity
execute if score #rtcreactorintermediate info matches 1 if score #rtcreactorintermediate2 info matches 0 at @e[type=marker,tag=limboentitytest] run summon minecraft:armor_stand ~ ~ ~ {ArmorItems: [{id: "minecraft:leather_boots", tag: {Damage: 0, display: {color: 16711680}}, Count: 1b}, {id: "minecraft:leather_leggings", tag: {Damage: 0, display: {color: 16711680}}, Count: 1b}, {id: "minecraft:leather_chestplate", tag: {Damage: 0, display: {color: 16711680}}, Count: 1b}, {id: "minecraft:player_head", tag: {display: {Name: '{"text":"","extra":[{"text":"Eye (red)","obfuscated":false,"italic":false,"underlined":false,"strikethrough":false,"color":"yellow","bold":false}]}'}, SkullOwner: {Name: "XSeries", Properties: {XSeries: [{Value: "13.6.0"}], textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOGNlM2IxZjI2ZjY1MjVhZjgyZjViYTE0ZGJiOTNiNWU3YTU0M2Q0NzdmYThkYTEyM2RiZmFhNmQyMjlmZGE0ZiJ9fX0="}]}, Id: [I; 1917957085, -1125173294, -1411474119, 1009182995]}, "Skulls:ID": "6806"}, Count: 1b}], Invisible: 0b, Air: 300s, HandItems: [{}, {}],ShowArms: 1b,NoBasePlate: 1b, Invulnerable: 1b, Tags: [limboentitynew]}
execute if score #rtcreactorintermediate info matches 2 if score #rtcreactorintermediate2 info matches 0 at @e[type=marker,tag=limboentitytest] run summon minecraft:armor_stand ~ ~ ~ {ArmorItems: [{id: "minecraft:leather_boots", tag: {Damage: 0, display: {color: 6684706}}, Count: 1b}, {id: "minecraft:leather_leggings", tag: {Damage: 0, display: {color: 6684706}}, Count: 1b}, {id: "minecraft:leather_chestplate", tag: {Damage: 0, display: {color: 6684706}}, Count: 1b}, {id: "minecraft:player_head", tag: {display: {Name: '{"text":"","extra":[{"text":"Demon","obfuscated":false,"italic":false,"underlined":false,"strikethrough":false,"color":"yellow","bold":false}]}'}, SkullOwner: {Name: "XSeries", Id: [I; 372502663, -998557480, -1993743116, 1539977509], Properties: {textures: [{Value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTFhYjRjZGFmNWIzNGZmZjEzODdjOWE2MzA4NzYyMTU4MmZlNzNiZGEyYTgzNmI2OGM1Y2ZmYzlhYTRmYzMifX19"}], XSeries: [{Value: "13.6.0"}]}}, "Skulls:ID": "3100"}, Count: 1b}], Invisible: 0b, Air: 300s, HandItems: [{}, {}], NoBasePlate: 1b, DisabledSlots: 0, ShowArms: 1b, Health: 20.0f, HurtTime: 0s, FallFlying: 0b,Fire: -1s, PortalCooldown: 0, Small: 0b, Invulnerable: 1b, Tags: [limboentitynew]}
# Associate entity with a player
scoreboard players operation @e[tag=limboentitynew,type=armor_stand,limit=1] redstoneworldID = @s redstoneworldID
# Despawn timer
scoreboard players set @e[tag=limboentitynew,type=armor_stand,limit=1] limboeffecttime 300
tag @e[tag=limboentitynew,type=armor_stand,limit=1] add limboentity
tag @e[tag=limboentitynew,type=armor_stand,limit=1] add limboentityunseen
tag @e[tag=limboentitynew,type=armor_stand,limit=1] remove limboentitynew

kill @e[type=marker,tag=limboentitytest]
