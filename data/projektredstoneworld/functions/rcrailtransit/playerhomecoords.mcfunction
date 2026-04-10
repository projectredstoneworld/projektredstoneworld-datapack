# Stations either depart on the x or the z axis, never both so for setting home coordinate we only need to set the coordinate that we're comparing

# Placeholders, this will tell the system which to compare with, coordinates should never be equal to 255. So 255 acts as placeholder
scoreboard players set @s rchomex 255
scoreboard players set @s rchomez 255 

# Testing
execute if entity @s[x=-3457,y=95,z=-120,dx=2,dy=4,dz=9] run scoreboard players set @s rchomez 1
# Theme Park
execute if entity @s[x=-2143,y=85,z=919,dx=12,dy=4,dz=2] run scoreboard players set @s rchomez 14
# Cruise Ship
execute if entity @s[x=-2110,y=73,z=174,dx=9,dy=4,dz=2] run scoreboard players set @s rchomez 6
# Main Bunker
execute if entity @s[x=-1344,y=87,z=-25,dx=9,dy=4,dz=2] run scoreboard players set @s rchomez 3
# Gerudo Desert
execute if entity @s[x=-710,y=65,z=570,dx=2,dy=4,dz=9] run scoreboard players set @s rchomex 6
# Villa
execute if entity @s[x=-668,y=74,z=914,dx=2,dy=4,dz=9] run scoreboard players set @s rchomez 14
# Spawn
execute if entity @s[x=-369,y=68,z=375,dx=2,dy=4,dz=9] run scoreboard players set @s rchomez 7
# Forgotten Isle
execute if entity @s[x=-364,y=65,z=-1861,dx=6,dy=4,dz=2] run scoreboard players set @s rchomex 9
# FI Bunker
execute if entity @s[x=-344,y=34,z=554,dx=6,dy=4,dz=6] run scoreboard players set @s rchomez 8
# Tavish Town
execute if entity @s[x=-186,y=97,z=1173,dx=9,dy=4,dz=2] run scoreboard players set @s rchomex 11
# Global Control / Founding Desert
execute if entity @s[x=-44,y=69,z=20,dx=2,dy=4,dz=9] run scoreboard players set @s rchomex 12
# RTC-2 / Tower 3.0
execute if entity @s[x=-26,y=65,z=679,dx=32,dy=5,dz=11] run scoreboard players set @s rchomez 11
# Eastern Village
execute if entity @s[x=446,y=69,z=122,dx=2,dy=4,dz=9] run scoreboard players set @s rchomez 5
# Blakewood Outpost
execute if entity @s[x=2882,y=77,z=661,dx=2,dy=4,dz=9] run scoreboard players set @s rchomez 10