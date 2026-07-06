# this is for the developer takedown hidden advancement, can only be granted if there is only one chaser, and needs to catch both Lucas and Ij (but not in the same game)
scoreboard players set #tagdevtakedown info 0
execute if entity @s[name=LLucas1425] run scoreboard players set #tagdevtakedown info 1
execute if entity @s[name=ijd710] run scoreboard players set #tagdevtakedown info 2
execute unless score #tagdevtakedown info matches 1..2 run return fail

execute as @a[tag=pontokachase,limit=1] run scoreboard players operation #tagdevtakedowntemp info = @s tagdevtakedown
scoreboard players operation #tagdevtakedowntemp info /= #tagdevtakedown info
scoreboard players operation #tagdevtakedowntemp info %= 2 CONSTANTS
execute if score #tagdevtakedowntemp info matches 0 run scoreboard players operation @s tagdevtakedown += #tagdevtakedowntemp info

execute as @a[tag=pontokachase,limit=1] if score @s tagdevtakedown matches 3 run advancement grant @a[tag=pontokachase,limit=1] only redstoneworld:rtctagtechaspects