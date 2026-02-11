execute at @s run playsound minecraft:block.bell.resonate master @a[distance=..12,tag=!rcrailrider] ~ ~ ~ 1 0
execute at @s run playsound minecraft:block.bell.resonate master @a[distance=15..32] ~ ~ ~ 0.25 0 0.25
execute as @a[tag=rcrailrider,distance=..12] at @s run playsound minecraft:block.bell.resonate master @s ~ ~ ~ 5 0.67 1

