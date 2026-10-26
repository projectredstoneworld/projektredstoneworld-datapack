execute as @a[tag=limbosteps3] at @s run playsound block.stone.step master @s 0 0 0 1 1.4 1
tag @a[tag=limbosteps3] add limbosteps4
tag @a[tag=limbosteps3,tag=limbosteps4] remove limbosteps3
schedule function projektredstoneworld:rtcreac/limboeffects/footsteps4 4t
