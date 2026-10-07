# Numbers can be tweaked later.

execute if score @s rtcfoodwithdrawal matches 2.. run effect give @s minecraft:weakness 15 0 true
execute if score @s rtcfoodwithdrawal matches 2.. run effect give @s minecraft:slowness 15 0 true
execute if score @s rtcfoodwithdrawal matches 2.. run effect give @s minecraft:mining_fatigue 15 0 true

execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:weakness 15 2 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:slowness 15 2 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:mining_fatigue 15 2 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:nausea 15 1 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:hunger 15 0 true
execute if score @s rtcfoodwithdrawal matches 5.. run effect give @s minecraft:darkness 15 0 true

# 1 mSv / second
execute if entity @s[tag=radcancer] run scoreboard players add @s radiationdose 2
