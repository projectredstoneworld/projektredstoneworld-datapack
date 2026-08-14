# Input is #rtcreactorwaterlevel info should be 0 through 32
# Allow full modification of RTC core in /fill
gamerule commandModificationBlockLimit 40000
# Clamp values
execute if score #rtcreactorwaterlevel info matches ..-1 run scoreboard players set #rtcreactorwaterlevel info 0
execute if score #rtcreactorwaterlevel info matches 33.. run scoreboard players set #rtcreactorwaterlevel info 32

# Map to Y
scoreboard players remove #rtcreactorwaterlevel info 57
execute store result entity @e[tag=rtcwaterlevelset,type=marker,limit=1] Pos[1] double 1 run scoreboard players get #rtcreactorwaterlevel info

# Add water
#fill 202 -56 590 170 -25 622 light[level=15,waterlogged=true] replace light[level=15,waterlogged=false]

execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] run fill 202 -56 590 170 ~ 622 light[level=15,waterlogged=true] replace light[level=15,waterlogged=false]
# Empty Water
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] if score #rtcreactorwaterlevel info matches -57..-26 run fill 202 ~1 590 170 -25 622 light[level=15,waterlogged=false] replace light[level=15,waterlogged=true]

# Walls
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] run fill 202 -56 590 170 ~ 622 andesite_wall[waterlogged=true,up=true] replace andesite_wall[waterlogged=false,up=true]
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] run fill 202 -56 590 170 ~ 622 polished_tuff_wall[waterlogged=true,up=true] replace polished_tuff_wall[waterlogged=false,up=true]
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] run fill 202 -56 590 170 ~ 622 deepslate_tile_wall[waterlogged=true,up=true] replace deepslate_tile_wall[waterlogged=false,up=true]
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] if score #rtcreactorwaterlevel info matches -57..-26 run fill 202 ~1 590 170 -25 622 andesite_wall[up=true,waterlogged=false] replace andesite_wall[up=true,waterlogged=true]
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] if score #rtcreactorwaterlevel info matches -57..-26 run fill 202 ~1 590 170 -25 622 polished_tuff_wall[up=true,waterlogged=false] replace polished_tuff_wall[up=true,waterlogged=true]
execute at @e[tag=rtcwaterlevelset,type=marker,limit=1] if score #rtcreactorwaterlevel info matches -57..26 run fill 202 ~1 590 170 -25 622 deepslate_tile_wall[up=true,waterlogged=false] replace deepslate_tile_wall[up=true,waterlogged=true]




gamerule commandModificationBlockLimit 32768