setblock -260 41 390 minecraft:redstone_block
scoreboard players remove @a[tag=rcraildebt] rcrailmonths 1
execute as @a[tag=rcraildebt] unless score @s rcrailmonths matches 0.. run tellraw @s {"text":"Payment was successful, thank you for using RCorp Rail!","color":"green"}

execute as @a[tag=rcraildebt] unless score @s rcrailmonths matches 0.. run return run tag @s remove rcraildebt

execute as @a[tag=rcraildebt] if score @s rcrailmonths matches 0.. run schedule function projektredstoneworld:processrcrailsub 5t