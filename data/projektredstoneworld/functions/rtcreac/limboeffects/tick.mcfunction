execute unless entity @a[tag=limbo,limit=1] run scoreboard players set #limboactive info 0

execute as @a[tag=limbo] run scoreboard players remove @s limboeffecttime 1

execute as @a[tag=limbo,scores={limbolvl=1,limboeffecttime=0}] run function projektredstoneworld:rtcreac/limboeffects/sporadic1
execute as @a[tag=limbo,scores={limbolvl=2,limboeffecttime=0}] run function projektredstoneworld:rtcreac/limboeffects/sporadic2
execute as @a[tag=limbo,scores={limbolvl=3,limboeffecttime=0}] run function projektredstoneworld:rtcreac/limboeffects/sporadic3
execute as @a[tag=limbo,scores={limbolvl=4,limboeffecttime=0}] run function projektredstoneworld:rtcreac/limboeffects/sporadic4

execute as @a[tag=limbo,scores={limboeffecttime=0}] store result score @s limboeffecttime run random value 400..700

execute if score #limbosteptimer info matches 1.. run scoreboard players remove #limbosteptimer info 1
execute if score #limbosteptimer info matches 0 run function projektredstoneworld:rtcreac/limboeffects/footsteps1

# Limbo entity code
execute as @a[tag=limbo,scores={limbolvl=3}] at @s if predicate projektredstoneworld:is_seeing_limbo_entity on target if entity @s[tag=limboentityunseen] if score @s redstoneworldID = @p redstoneworldID run function projektredstoneworld:rtcreac/limboeffects/spottedlimboentity
execute if entity @e[tag=limboentity,type=armor_stand,limit=1] as @e[tag=limboentity,type=armor_stand] run function projektredstoneworld:rtcreac/limboeffects/ticklimboentity
