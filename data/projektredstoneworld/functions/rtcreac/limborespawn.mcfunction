# Execute as dying player

clear @s

execute if score @s limbolvl matches 1 run tp @s 164.5 -40.0 510.0 0 0
execute if score @s limbolvl matches 2 run tp @s 134.0 -50.0 581.3 -180 0
execute if score @s limbolvl matches 3 run tp @s 140.5 -61.0 405.0 -90 0
execute if score @s limbolvl matches 4 run tp @s 137.5 -63.0 595.5 0 0
execute unless score @s limbolvl matches 1..3 run return fail
