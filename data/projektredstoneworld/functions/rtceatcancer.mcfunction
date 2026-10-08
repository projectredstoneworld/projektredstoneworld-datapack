advancement revoke @s only projektredstoneworld:rtc_eat_cancer
execute store result score #foodrisk info run random value 1..100

# 25% chance of no cancer but actual boost in strength and speed
execute if score #foodrisk info matches 1..25 run tellraw @s {"text":"Wow, that tasted REALLY good! I feel a rush of energy!","color":"green","bold":true}
execute if score #foodrisk info matches 1..25 run effect give @s minecraft:strength 180 1 true
execute if score #foodrisk info matches 1..25 run effect give @s minecraft:speed 180 3 true

# 25% chance of 100 mSv radiation
execute if score #foodrisk info matches 26..50 run tellraw @s {"text":"I'm feeling a bit sick... that tasted good but it is a good thing the hospital is across the bridge...","color":"red","bold":true}
execute if score #foodrisk info matches 26..50 run scoreboard players add @s radiationdose 100
execute if score #foodrisk info matches 26..50 run scoreboard players add @s rtcfoodtimesmsv 1
execute if score @s rtcfoodtimesmsv matches 30.. run tag @s add radcancer
execute if score @s rtcfoodtimesmsv matches 30.. run scoreboard players reset @s rtcfoodtimesmsv

execute if score #foodrisk info matches 51..100 run tellraw @s {"text":"That was delicious but probably not the best for me...","color":"yellow","bold":true}

# Set days without last rtc fast food to 0, and add 1 to the total times eaten
scoreboard players set @s rtcfoodwithdrawal 0
scoreboard players add @s rtcfoodtimes 1

# Since meals come in 3 items each meal milestone should be 3*rtcfoodtimes
# 5 meals for addiction, 24 meals for cancer warning, 32 meals for cancer
execute if score @s rtcfoodtimes matches 15.. run tellraw @s {"text":"You are starting to feel addicted to fast food... You may want to get that checked out at the Diagnosing Room in RTC Hospital!","color":"red","bold":true}
execute if score @s rtcfoodtimes matches 15.. run tag @s add rtcfoodaddiction
execute if score @s rtcfoodtimes matches 72..95 run tellraw @s {"text":"Warning: You have eaten a lot of fast food recently. Your cholesterol is rising and your risk of cancer is increasing!","color":"red","bold":true}
execute if score @s rtcfoodtimes matches 96.. run tellraw @s {"text":"You have cancer! Handle it at the RTC Hospital radiation treatment center.","color":"red","bold":true}
execute if score @s rtcfoodtimes matches 96.. run tag @s add radcancer