execute unless score #tagdone info matches 1 run scoreboard players add @a[tag=rtcfoodaddiction] rtcfoodwithdrawal 1

execute if score @s rtcfoodwithdrawal matches 2.. run tellraw @s {"text":"You are starting to feel withdrawal symptoms from not eating RTC fast food recently. You may want to get that checked out at the Diagnosing Room in RTC Hospital! (or just eat some fast food)","color":"red","bold":true}

execute if score @s rtcfoodwithdrawal matches 5.. run tellraw @s {"text":"You are starting to feel very sick from not eating RTC fast food recently. You may want to get that checked out at the Diagnosing Room in RTC Hospital! (or just eat some fast food)","color":"dark_red","bold":true}

execute if entity @s[tag=radcancer] run tellraw @s {"text":"REMINDER: You have cancer from too much fast food. Get a RTC Hospital Radiation Removal Pass and get treated!","color":"dark_red","bold":true}