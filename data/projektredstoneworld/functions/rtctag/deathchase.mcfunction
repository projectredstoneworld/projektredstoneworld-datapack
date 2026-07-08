execute if score #tagbounds info matches 3 run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s","bold":false},{"text":" has died! Laugh at this user.","color":"#FF0055","bold":false}]
execute if score #tagbounds info matches 3 run scoreboard players set @s tagdeathrip 0
execute if score #tagbounds info matches 3 run return fail

execute if entity @s[x=-317,y=62,z=404,dx=4,dy=5,dz=5] run tellraw @a [{"text":"[Tag] ","color":"#FF0055","bold":true},{"selector":"@s","bold":false},{"text":" has died! Laugh at this user.","color":"#FF0055","bold":true}]
execute if entity @s[x=-317,y=62,z=404,dx=4,dy=5,dz=5] run scoreboard players set @s tagdeathrip 0
tag @s[x=-317,y=62,z=404,dx=4,dy=5,dz=5] add pontokaskibiditoilet
execute if score #tagbounds info matches -1 if score #tagchasec info matches 1 in overworld as @s[tag=pontokaskibiditoilet] run tellraw @s "You have been placed in Deepslate Diner of Tower 2. Make your way over to Tower 3.0 to start chasing again!"
execute if score #tagbounds info matches -1 if score #tagchasec info matches 1 in overworld as @s[tag=pontokaskibiditoilet] run tp @s -24.5 133.5 581.5 0 0
execute if score #tagbounds info matches -1 if score #tagchasec info matches 2.. in overworld as @s[tag=pontokaskibiditoilet] run tp @s -140.5 67.0 726.5 -180 0
execute if score #tagbounds info matches -1 if score #tagchasec info matches 2.. in overworld as @s[tag=pontokaskibiditoilet] run tellraw @s "You have been placed near the Reborn X museum. Make your way to the RTC to start chasing again!"
execute if score #tagbounds info matches 1 in overworld as @s[tag=pontokaskibiditoilet] run tp @s -24.5 133.5 581.5 0 0
execute if score #tagbounds info matches 1 in overworld as @s[tag=pontokaskibiditoilet] run tellraw @s "You have been placed in Deepslate Diner of Tower 2. Make your way over to Tower 3.0 to start chasing again!"
execute if score #tagbounds info matches 2 in overworld as @s[tag=pontokaskibiditoilet] run tp @s -140.5 67.0 726.5 -180 0
execute if score #tagbounds info matches 2 in overworld as @s[tag=pontokaskibiditoilet] run tellraw @s "You have been placed near the Reborn X museum. Make your way to the RTC to start chasing again!"
gamemode adventure @s
tag @s remove pontokaskibiditoilet
