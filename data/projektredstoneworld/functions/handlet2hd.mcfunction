execute as @e[type=minecraft:block_display,scores={t2roomid=1..},distance=..2,limit=2,sort=nearest,tag=southrighthinge] run data merge entity @s {start_interpolation:-1,interpolation_duration:10,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}
execute as @e[type=block_display,scores={t2roomid=1..},distance=..2,limit=2,sort=nearest,tag=southlefthinge] run data merge entity @s {start_interpolation:-1,interpolation_duration:10,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.82f,0f,0f],scale:[1f,1f,1f]}}
execute as @e[type=minecraft:block_display,scores={t2roomid=1..},distance=..2,limit=2,sort=nearest,tag=northlefthinge] run data merge entity @s {start_interpolation:-1,interpolation_duration:10,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0.707f,0f,0.707f],translation:[0f,0f,1f],scale:[1f,1f,1f]}}
execute as @e[type=minecraft:block_display,scores={t2roomid=1..},distance=..2,limit=2,sort=nearest,tag=northrighthinge] run data merge entity @s {start_interpolation:-1,interpolation_duration:10,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}
execute as @e[type=minecraft:block_display,scores={t2roomid=1..},distance=..2,limit=2,sort=nearest,tag=westlefthinge] run data merge entity @s {start_interpolation:-1,interpolation_duration:10,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,-0.707f,0f,0.707f],translation:[1f,0f,0f],scale:[1f,1f,1f]}}
execute as @e[type=minecraft:block_display,scores={t2roomid=1..},distance=..2,limit=2,sort=nearest,tag=westrighthinge] run data merge entity @s {start_interpolation:-1,interpolation_duration:10,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,-0.707f,0f,0.707f],translation:[1f,0f,0.82f],scale:[1f,1f,1f]}}


execute as @e[type=block_display,scores={t2roomid=1..},distance=..2,tag=!northrighthinge] at @s run fill ~ ~ ~ ~ ~ ~ air replace barrier
execute as @e[type=block_display,scores={t2roomid=1..},distance=..2,tag=northrighthinge] at @s run fill ~-1 ~ ~-1 ~-1 ~ ~-1 air replace barrier

playsound block.wooden_door.open master @a[distance=..10] ~ ~ ~ 360 1 1

tag @s add tobeclosed
schedule function projektredstoneworld:autocloset2hd 100t