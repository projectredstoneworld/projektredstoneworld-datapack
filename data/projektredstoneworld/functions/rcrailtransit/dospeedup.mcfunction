# Run as driving minecart every tick

# Run raycast
function projektredstoneworld:rcrailtransit/straightpathcheck

# Boost I - 0.7 b/t - 14 bps
execute if score @s rcrailcartstraight matches 8..15 if score @s rcrailcartstraightx matches 1 run tp @s ~0.7 ~ ~
execute if score @s rcrailcartstraight matches 8..15 if score @s rcrailcartstraightx matches -1 run tp @s ~-0.7 ~ ~
execute if score @s rcrailcartstraight matches 8..15 if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~0.7
execute if score @s rcrailcartstraight matches 8..15 if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-0.7

# Boost II - 1.1 b/t - 22 bps
execute if score @s rcrailcartstraight matches 16..31 if score @s rcrailcartstraightx matches 1 run tp @s ~1.1 ~ ~
execute if score @s rcrailcartstraight matches 16..31 if score @s rcrailcartstraightx matches -1 run tp @s ~-1.1 ~ ~
execute if score @s rcrailcartstraight matches 16..31 if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~1.1
execute if score @s rcrailcartstraight matches 16..31 if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-1.1

# Boost III - 1.7 b/t - 34 bps
execute if score @s rcrailcartstraight matches 32..47 if score @s rcrailcartstraightx matches 1 run tp @s ~1.7 ~ ~
execute if score @s rcrailcartstraight matches 32..47 if score @s rcrailcartstraightx matches -1 run tp @s ~-1.7 ~ ~
execute if score @s rcrailcartstraight matches 32..47 if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~1.7
execute if score @s rcrailcartstraight matches 32..47 if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-1.7

# Boost IV - 2.1 b/t - 42 bps
execute if score @s rcrailcartstraight matches 48.. if score @s rcrailcartstraightx matches 1 run tp @s ~2.1 ~ ~
execute if score @s rcrailcartstraight matches 48.. if score @s rcrailcartstraightx matches -1 run tp @s ~-2.1 ~ ~
execute if score @s rcrailcartstraight matches 48.. if score @s rcrailcartstraightz matches 1 run tp @s ~ ~ ~2.1
execute if score @s rcrailcartstraight matches 48.. if score @s rcrailcartstraightz matches -1 run tp @s ~ ~ ~-2.1

# Give minecart motion
execute if score @s rcrailcartstraightx matches 1 run data merge entity @s {Motion:[0.4d,0.0d,0.0d]}
execute if score @s rcrailcartstraightx matches -1 run data merge entity @s {Motion:[-0.4d,0.0d,0.0d]}
execute if score @s rcrailcartstraightz matches 1 run data merge entity @s {Motion:[0.0d,0.0d,0.4d]}
execute if score @s rcrailcartstraightz matches -1 run data merge entity @s {Motion:[0.0d,0.0d,-0.4d]}

