execute as @a[tag=rakegame] run execute store result score @s rakeX run data get entity @s Pos[0]
execute as @a[tag=rakegame] run execute store result score @s rakeY run data get entity @s Pos[1]
execute as @a[tag=rakegame] run execute store result score @s rakeZ run data get entity @s Pos[2]



execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakeXdiff = @s rakeX
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] at @s run scoreboard players operation @s rakeXdiff -= @p[tag=rakegame,tag=therake] rakeX
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakeYdiff = @s rakeY
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] at @s run scoreboard players operation @s rakeYdiff -= @p[tag=rakegame,tag=therake] rakeY
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakeZdiff = @s rakeZ
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] at @s run scoreboard players operation @s rakeZdiff -= @p[tag=rakegame,tag=therake] rakeZ

execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakeXdiff *= @s rakeXdiff
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakeYdiff *= @s rakeYdiff
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rakeZdiff *= @s rakeZdiff


execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rake2Distance = @s rakeXdiff
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rake2Distance += @s rakeYdiff
execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] run scoreboard players operation @s rake2Distance += @s rakeZdiff


scoreboard players set @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] rakesqrtI 1
scoreboard players set @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] rakesqrtX 0
scoreboard players set @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] raketrackerdist 0

execute as @a[tag=rakegame,tag=raketracker,scores={raketracker=1}] if score @s rake2Distance > @s rakesqrtX run function projektredstoneworld:rakesqrt