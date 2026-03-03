tag @s add handleGhostMotion
execute store result score #rcrailghostxmotion info run data get entity @s Motion[0] 1000
execute store result score #rcrailghostzmotion info run data get entity @s Motion[2] 1000
execute if score #rcrailghostxmotion info matches 0 if score #rcrailghostzmotion info matches 0 run function projektredstoneworld:rcrailtransit/killrcrailcar
tag @s remove handleGhostMotion 
tag @s add handledGhostMotion
execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=rcrailghost,tag=rcrailaged,tag=!handledGhostMotion,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/ghostpodmotioncheck
