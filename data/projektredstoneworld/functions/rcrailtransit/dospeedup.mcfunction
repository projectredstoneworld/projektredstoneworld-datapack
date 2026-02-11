# Run as driving minecart every tick

# Run raycast
function projektredstoneworld:rcrailtransit/straightpathcheck

execute if score @s rcrailcartstraight matches ..7 run scoreboard players set @s rcrspeeduptimetarget 0
execute if score @s rcrailcartstraight matches 8..15 run scoreboard players set @s rcrspeeduptimetarget 1
execute if score @s rcrailcartstraight matches 16..31 run scoreboard players set @s rcrspeeduptimetarget 13
execute if score @s rcrailcartstraight matches 32..47 run scoreboard players set @s rcrspeeduptimetarget 25
execute if score @s rcrailcartstraight matches 48.. run scoreboard players set @s rcrspeeduptimetarget 37

# Boost I - 0.7 b/t - 14 bps
execute if score @s rcrspeeduptime matches 1..12 if score @s rcrailcartstraightx matches 1 run tp @s ~0.7 ~ ~
execute if score @s rcrspeeduptime matches 1..12 if score @s rcrailcartstraightx matches -1 run tp @s ~-0.7 ~ ~
execute if score @s rcrspeeduptime matches 1..12 if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~0.7
execute if score @s rcrspeeduptime matches 1..12 if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-0.7

# Boost II - 1.1 b/t - 22 bps
execute if score @s rcrspeeduptime matches 13..24 if score @s rcrailcartstraightx matches 1 run tp @s ~1.1 ~ ~
execute if score @s rcrspeeduptime matches 13..24 if score @s rcrailcartstraightx matches -1 run tp @s ~-1.1 ~ ~
execute if score @s rcrspeeduptime matches 13..24 if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~1.1
execute if score @s rcrspeeduptime matches 13..24 if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-1.1

# Boost III - 1.7 b/t - 34 bps
execute if score @s rcrspeeduptime matches 25..36 if score @s rcrailcartstraightx matches 1 run tp @s ~1.7 ~ ~
execute if score @s rcrspeeduptime matches 25..36 if score @s rcrailcartstraightx matches -1 run tp @s ~-1.7 ~ ~
execute if score @s rcrspeeduptime matches 25..36 if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~1.7
execute if score @s rcrspeeduptime matches 25..36 if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-1.7

# Boost IV - 2.1 b/t - 42 bps
execute if score @s rcrspeeduptime matches 37.. if score @s rcrailcartstraightx matches 1 run tp @s ~2.1 ~ ~
execute if score @s rcrspeeduptime matches 37.. if score @s rcrailcartstraightx matches -1 run tp @s ~-2.1 ~ ~
execute if score @s rcrspeeduptime matches 37.. if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~2.1
execute if score @s rcrspeeduptime matches 37.. if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-2.1

execute if score @s rcrspeeduptime > @s rcrspeeduptimetarget run scoreboard players operation @s rcrspeeduptime = @s rcrspeeduptimetarget
execute if score @s rcrspeeduptime < @s rcrspeeduptimetarget run scoreboard players add @s rcrspeeduptime 1
scoreboard players operation @s rcrspeedupspeed = @s rcrspeeduptime
scoreboard players remove @s rcrspeedupspeed 1
scoreboard players operation @s rcrspeedupspeed /= 12 CONSTANTS
execute at @s if score @s rcrspeedupspeed > @s rcrspeeduppspeed run playsound minecraft:block.beacon.activate master @a[distance=..48] ~ ~ ~ 1.5 2 0.4
execute at @s if score @s rcrspeedupspeed < @s rcrspeeduppspeed run playsound minecraft:block.beacon.deactivate master @a[distance=..48] ~ ~ ~ 1.5 2 0.4
scoreboard players operation @s rcrspeeduppspeed = @s rcrspeedupspeed

execute at @s run playsound minecraft:block.bell.resonate master @a[distance=..7.2] ~ ~ ~ 0.5 0
execute at @s run playsound minecraft:block.bell.resonate master @a[distance=7.2..] ~ ~ ~ 0.05 0 0.05

# Give minecart motion
execute if score @s rcrailcartstraightx matches 1 if score @s rcrailcartstraight matches 6.. run data merge entity @s {Motion:[2.0d,0.0d,0.0d]}
execute if score @s rcrailcartstraightx matches -1 if score @s rcrailcartstraight matches 6.. run data merge entity @s {Motion:[-2.0d,0.0d,0.0d]}
execute if score @s rcrailcartstraightz matches 1 if score @s rcrailcartstraight matches 6.. run data merge entity @s {Motion:[0.0d,0.0d,2.0d]}
execute if score @s rcrailcartstraightz matches -1 if score @s rcrailcartstraight matches 6.. run data merge entity @s {Motion:[0.0d,0.0d,-2.0d]}

