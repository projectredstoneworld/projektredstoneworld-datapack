execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakesqrtX += @s rakesqrtI
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players add @s raketrackerdist 1
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players add @s rakesqrtI 2
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] if score @s rake2Distance > @s rakesqrtX run function projektredstoneworld:rakesqrt