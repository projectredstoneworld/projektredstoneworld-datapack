execute as @e[type=interaction,tag=taken] if score @s t2roomid = @a[tag=seent2hpurchase,scores={t2hotelshop=5},limit=1] t2roomid run tag @s remove taken

execute if score @s t2roomid matches 1..5 run give @s emerald 2
execute if score @s t2roomid matches 6..8 run give @s emerald 8
execute if score @s t2roomid matches 9..10 run give @s emerald 16

scoreboard players set @s t2roomid 0

tellraw @s {"text":"Successfully returned hotel room. Thank you for choosing the RTC Hotel, come back soon!","color":"gold"}