# Execute as arriving player
scoreboard players operation #rcrailadvtemp info = @s rcsadv
scoreboard players operation #rcrailadvtemp info /= #rcrailcurrents info 
scoreboard players operation #rcrailadvtemp info %= 2 CONSTANTS

execute if score #rcrailadvtemp info matches 0 run scoreboard players operation @s rcsadv += #rcrailcurrents info

execute if score @s rcsadv matches 32767 run advancement grant @s only redstoneworld:rcrworldtravel