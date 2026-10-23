scoreboard players set #rtchelppimsick info 0

execute if entity @s[tag=rtcfoodaddiction] run tellraw @s {"text":"[Doctor Winbuild] You have an addiction to fast food! Head to the Therapy Room (Floor 8, South-East corner) immediately!","color":"red"}
execute if entity @s[tag=rtcfoodaddiction] run scoreboard players set #rtchelppimsick info 1

execute if score @s radiationdose matches 100.. run tellraw @s {"text":"[Doctor Winbuild] You have way too much radiation exposure! Grab a pass from the hospital lobby and head to the radiation treatment center (Floor 8, North-West corner) immediately!","color":"red"}
execute if score @s radiationdose matches 100.. run scoreboard players set #rtchelppimsick info 1

execute if score #rtchelppimsick info matches 0 run tellraw @s {"text":"[Doctor Winbuild] Hm, you look quite healthy! I don't think we can help you here today.", "color":"green"}
