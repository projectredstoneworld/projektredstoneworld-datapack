execute as @a[tag=limbosteps2] at @s run playsound block.stone.step master @s 0 0 0 1 1.6 1
tag @a[tag=limbosteps2] add limbosteps3
tag @a[tag=limbosteps2,tag=limbosteps3] remove limbosteps2
schedule function projektredstoneworld:rtcreac/limboeffects/footsteps3 4t
