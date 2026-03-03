tag @s add handleGhostMotion
execute store result score #rcrailghostxmotion info run data get entity @s Motion[0] 1000
execute store result score #rcrailghostzmotion info run data get entity @s Motion[2] 1000

execute at @s if score #rcrailghostxmotion info matches 0 if score #rcrailghostzmotion info matches 0 unless entity @e[type=marker,tag=rcsmanager,distance=..32] if entity @s[tag=rcrgfail2,tag=rcrgfail3] run function projektredstoneworld:rcrailtransit/killrcrailcar
execute at @s if score #rcrailghostxmotion info matches 0 if score #rcrailghostzmotion info matches 0 unless entity @e[type=marker,tag=rcsmanager,distance=..32] if entity @s[tag=rcrgfail2] run tag @s add rcrgfail3
execute at @s if score #rcrailghostxmotion info matches 0 if score #rcrailghostzmotion info matches 0 unless entity @e[type=marker,tag=rcsmanager,distance=..32] run tag @s add rcrgfail2

execute at @s unless score #rcrailghostxmotion info matches 0 unless score #rcrailghostzmotion info matches 0 run tag @s remove rcrgfail2
execute at @s unless score #rcrailghostxmotion info matches 0 unless score #rcrailghostzmotion info matches 0 run tag @s remove rcrgfail3

tag @s remove handleGhostMotion 
tag @s add handledGhostMotion
execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailghost,tag=rcrailaged,tag=!handledGhostMotion,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/ghostpodmotioncheck
