# Numbers can be tweaked later. Called as @a from rcrailschedule
execute if entity @s[tag=!rtcfoodaddiction,tag=!radcancer] if score #rtccourtcancer info matches ..19 run return fail


execute if score @s rtcfoodwithdrawal matches 2.. run effect give @s minecraft:weakness 15 0 true
execute if score @s rtcfoodwithdrawal matches 2.. run effect give @s minecraft:slowness 15 0 true
execute if score @s rtcfoodwithdrawal matches 2.. run effect give @s minecraft:mining_fatigue 15 0 true

execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:weakness 15 2 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:slowness 15 2 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:mining_fatigue 15 2 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:nausea 15 1 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:hunger 15 0 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:darkness 15 0 true

# 4 mSv / second
execute if entity @s[tag=radcancer] run scoreboard players add @s radiationdose 2
# Add cancer temp if the food court cancer level is high enough
execute if score #rtccourtcancer info matches 40.. run scoreboard players add @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36] radiationdose 2
execute if score #rtccourtcancer info matches 40.. run effect give @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36] darkness 15 0 true


execute if score #rtccourtcancer info matches 20.. run effect give @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36] slowness 15 0 true

execute unless entity @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36] run tag @s remove courtcancerwarning
execute if score #rtccourtcancer info matches 20.. run tellraw @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36,tag=!courtcancerwarning] {"text":"The RTC Food Court is beginning to have cancerous material buildup from processed food. Clear it up with the Janitor job!","color":"yellow","bold":true}
execute if score #rtccourtcancer info matches 40.. run tellraw @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36,tag=!courtcancerwarning] {"text":"The RTC Food Court is now very cancerous! Clear it up with the Janitor job!","color":"red","bold":true}
execute if score #rtccourtcancer info matches 20.. run tag @s[x=-23,y=173,z=578,dx=32,dy=9,dz=36] add courtcancerwarning