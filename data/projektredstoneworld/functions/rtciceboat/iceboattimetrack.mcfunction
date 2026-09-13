# This must be repeated by a repeated command block at the very least, iceboat_tick and iceboat_time can be gotten but not set
# This function must be repeated for as long as the current race lasts (if there's a parallel race, don't do parallel races >:T)
# Each boater must be given the tag iceboat_time_tracked before starting the race and (therefore) its timer

scoreboard players add @a[tag=iceboat_time_tracked] iceboat_tick 1
execute as @a[tag=iceboat_time_tracked] run scoreboard players operation @s iceboat_time = @s iceboat_tick
execute as @a[tag=iceboat_time_tracked] run scoreboard players operation @s iceboat_time /= 20 CONSTANTS