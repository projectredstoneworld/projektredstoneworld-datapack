# Coord displays
execute as @a[tag=pontoka] at @s if score #tagcoord info matches 1 run function projektredstoneworld:rtctag/coorddisp

execute if score #tagstatus info matches ..1 run return fail

execute as @a[tag=pontokarun] run function projektredstoneworld:rtctag/bounds
execute as @a[tag=pontokachase] if score #tagstatus info matches 3 run function projektredstoneworld:rtctag/bounds
tag @a remove pontokaskibidi
execute unless score #tagstatus info matches 3 run tag @a[tag=pontokachase] add pontokaskibidi
title @a[tag=!tagrtc2bound,tag=!pontokaskibidi,tag=pontoka] times 0 20 10
execute if score #tagbounds info matches 1 as @a[tag=!tagrtc2bound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbounds info matches 2 as @a[tag=!tagrtcbound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbounds info matches 3 as @a[tag=!tagfirtcbound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
# Change for logout protection
execute store result score #tagchasec info if entity @a[tag=pontokachase]
execute if score #tagbounds info matches -1 if score #tagchasec info matches 1 as @a[tag=!tagrtc2bound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbounds info matches -1 if score #tagchasec info matches 2.. as @a[tag=!tagrtcbound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbounds info matches 1 as @a[tag=!tagrtc2bound,gamemode=!creative,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
execute if score #tagbounds info matches 2 as @a[tag=!tagrtcbound,gamemode=!creative,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
execute if score #tagbounds info matches 3 as @a[tag=!tagfirtcbound,gamemode=!creative,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
# Change for logout protection
execute store result score #tagchasec info if entity @a[tag=pontokachase]
execute if score #tagbounds info matches -1 if score #tagchasec info matches 1 as @a[tag=!tagrtc2bound,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
execute if score #tagbounds info matches -1 if score #tagchasec info matches 2.. as @a[tag=!tagrtcbound,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world

# This is for the advancement "Pontoka!" which is granted to the player with a near miss by the chaser.
execute as @a[tag=pontokarun] at @s if entity @a[tag=pontokachase,distance=..3.5] run tag @s add pontokanearmiss

execute if score #tagchasec info matches 1 as @a[scores={tagdeathrip=1..},tag=pontokarun] run function projektredstoneworld:rtctag/devtakedownadv
execute as @a[scores={tagdeathrip=1..},tag=pontokarun] run function projektredstoneworld:rtctag/deathrun
execute as @a[scores={tagdeathrip=1..},tag=pontokachase] run function projektredstoneworld:rtctag/deathchase

execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run advancement grant @s only redstoneworld:rtctagnearmiss
execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run tellraw @a[tag=pontoka] [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s"},{"text":" has had a successful Pontoka!! against a chaser (escaped a close call!)","color":"#FF0055"}]
execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run playsound block.end_portal.spawn master @a[tag=pontoka] ~ ~ ~ 360 1 1
execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run tag @s remove pontokanearmiss