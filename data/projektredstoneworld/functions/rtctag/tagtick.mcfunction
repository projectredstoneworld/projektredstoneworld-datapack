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
execute if score #tagstatus info matches 3 if score #tagchasec info < #tagchasecmax info run scoreboard players operation #tagchasec info = #tagchasecmax info
execute if score #tagbounds info matches -1 if score #tagchasec info matches 1 as @a[tag=!tagrtc2bound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbounds info matches -1 if score #tagchasec info matches 2.. as @a[tag=!tagrtcbound,tag=!pontokaskibidi,tag=pontoka] run title @s title {"text":"You are out of bounds","color":"#FF0000"}
execute if score #tagbounds info matches 1 as @a[tag=!tagrtc2bound,gamemode=!creative,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
execute if score #tagbounds info matches 2 as @a[tag=!tagrtcbound,gamemode=!creative,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
execute if score #tagbounds info matches 3 as @a[tag=!tagfirtcbound,gamemode=!creative,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
# Change for logout protection
execute store result score #tagchasec info if entity @a[tag=pontokachase]
execute if score #tagstatus info matches 3 if score #tagchasec info < #tagchasecmax info run scoreboard players operation #tagchasec info = #tagchasecmax info
execute if score #tagbounds info matches -1 if score #tagchasec info matches 1 as @a[tag=!tagrtc2bound,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world
execute if score #tagbounds info matches -1 if score #tagchasec info matches 2.. as @a[tag=!tagrtcbound,tag=pontokarun,tag=!pontokaskibidi] run damage @s 5 out_of_world

#Log out protection
execute if score #tagstatus info matches 3 if score #tagchasec info > #tagchasecmax info run scoreboard players operation #tagchasecmax info = #tagchasec info
# This is for the advancement "Pontoka!" which is granted to the player with a near miss by the chaser.
execute as @a[tag=pontokarun] if score #tagstatus info matches 3 at @s if entity @a[tag=pontokachase,distance=..3.5] run tag @s add pontokanearmiss

execute as @a[tag=pontokachase,tag=taginfectunverify] if entity @s[x=-317,y=62,z=404,dx=4,dy=5,dz=5] at @s run tp @s @a[tag=pontokachase,limit=1,sort=furthest]
execute as @a[tag=pontokachase,tag=taginfectunverify] if entity @s[x=-317,y=62,z=404,dx=4,dy=5,dz=5] at @s run gamemode adventure @s
execute as @a[tag=pontokachase,tag=taginfectunverify] unless entity @s[x=-317,y=62,z=404,dx=4,dy=5,dz=5] at @s run tag @s remove taginfectunverify 

# Handle Emergency exit
tag @a remove pontokaemer
tag @a remove pontokaemer
tag @e[type=minecart,x=-4,y=-9,z=696,dx=2,dy=350,dz=2] remove pontokagoodcart
tag @a[x=-4,y=-9,z=696,dx=2,dy=350,dz=2,tag=pontoka] add pontokaemer
execute as @e[type=minecart,x=-4,y=-9,z=696,dx=2,dy=350,dz=2] on passengers if entity @s[type=player] on vehicle run tag @s add pontokagoodcart
execute as @e[type=minecart,x=-4,y=-9,z=696,dx=2,dy=350,dz=2,tag=!pontokagoodcart] run kill @s
execute as @a[tag=pontokaemer] run effect give @s jump_boost 2 40 true
execute as @e[type=minecart,x=-4,y=-9,z=696,dx=2,dy=350,dz=2,tag=pontokagoodcart] on passengers if entity @s[type=player,tag=pontokaemer] run tag @s add pontokaemercart
# Add onto this as new floors added with emergency exits
execute as @a[tag=pontokaemer] unless entity @s[tag=pontokaemercart] unless entity @s[y=-9,dy=2] unless entity @s[y=56,dy=0] unless entity @s[y=77,dy=0] unless entity @s[y=83,dy=0] unless entity @s[y=96,dy=0] unless entity @s[y=114,dy=0] unless entity @s[y=140,dy=3] unless entity @s[y=169,dy=0] unless entity @s[y=193,dy=0] at @s run function projektredstoneworld:rtctag/emergencyexitbringback


execute if score #tagchasec info matches 1 as @a[scores={tagdeathrip=1..},tag=pontokarun] run function projektredstoneworld:rtctag/devtakedownadv
execute at @a[scores={tagdeathrip=1..}] run kill @e[type=item,distance=..4,nbt={Item:{id:"minecraft:player_head"}}]
execute as @a[scores={tagdeathrip=1..},tag=pontokachase] run function projektredstoneworld:rtctag/deathchase
execute as @a[scores={tagdeathrip=1..},tag=pontokarun] run function projektredstoneworld:rtctag/deathrun



execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run advancement grant @s only redstoneworld:rtctagnearmiss
execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run tellraw @a[tag=pontoka] [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s"},{"text":" has had a successful Pontoka!! against a chaser (escaped a close call!)","color":"#FF0055"}]
execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run playsound block.end_portal.spawn master @a[tag=pontoka] ~ ~ ~ 360 1 1
execute as @a[tag=pontokarun,tag=pontokanearmiss] at @s unless score @s tagdeathrip matches 1.. unless entity @a[tag=pontokachase,distance=..10] run tag @s remove pontokanearmiss

# Start the danger! timeout for missing players, putting each in 1 minute
execute unless entity @a[tag=pontokarun] run scoreboard players add #tagfailtime info 1
execute unless entity @a[tag=pontokachase] run scoreboard players add #tagfailtime info 1
execute if entity @a[tag=pontokarun] if entity @a[tag=pontokachase] run scoreboard players set #tagfailtime info 0
execute if score #tagfailtime info matches 1200.. run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"text":"The game has ended due to missing players!","bold":false,"color":"#FF0055"}]
execute if score #tagfailtime info matches 1200.. run function projektredstoneworld:rtctag/end