#choose a room
execute if score @s t2hotelshop matches 2 run tag @e[type=interaction,tag=econ,tag=!taken,limit=1,sort=random] add buyingroom
execute if score @s t2hotelshop matches 3 run tag @e[type=interaction,tag=limited,tag=!taken,limit=1,sort=random] add buyingroom
execute if score @s t2hotelshop matches 4 run tag @e[type=interaction,tag=t2minisuite,tag=!taken,limit=1,sort=random] add buyingroom

tag @e[type=interaction,tag=buyingroom] add taken

scoreboard players operation @s t2roomid = @e[type=interaction,tag=buyingroom,limit=1] t2roomid

tellraw @s ["",{"text":"You have successfully purchased room ","color":"green"},{"text":"#","bold":true,"color":"green"},{"score":{"name":"@s","objective":"t2roomid"},"bold":true,"color":"green"},{"text":"! Thank you for choosing the RTC Hotel","color":"green"}]

tag @e[type=interaction,tag=buyingroom,tag=taken] remove buyingroom