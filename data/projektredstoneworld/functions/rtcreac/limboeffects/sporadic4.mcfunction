execute store result score #rtcreactorintermediate info run random value 1..3
execute if score #rtcreactorintermediate info matches 1 run playsound minecraft:entity.enderman.stare master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorintermediate info matches 2 run playsound minecraft:entity.warden.nearby_closest master @s ~ ~ ~ 1 0 1
execute if score #rtcreactorintermediate info matches 3 run playsound minecraft:entity.warden.sonic_charge master @s ~ ~ ~ 1 0 1
