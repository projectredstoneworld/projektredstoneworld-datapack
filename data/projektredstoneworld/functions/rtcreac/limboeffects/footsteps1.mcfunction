tellraw @s {"text":"Footsteps"}
execute as @a[tag=limbosteps1] at @s run playsound block.stone.step master @s 0 0 0 0.5 1.2 0.5
tag @a[tag=limbosteps1] add limbosteps2
tag @a[tag=limbosteps1,tag=limbosteps2] remove limbosteps1
schedule function projektredstoneworld:rtcreac/limboeffects/footsteps2 4t
