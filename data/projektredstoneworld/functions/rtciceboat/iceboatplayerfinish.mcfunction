# This function must be executed through a command block at the finish line

scoreboard players add @a[tag=iceboat_time_tracked] iceboat_position 1

# Obligatory loser message
tag @p[tag=iceboat_time_tracked] add iceboat_mightve_lost
execute as @p[tag=iceboat_time_tracked] if entity @p[tag=iceboat_time_tracked, tag=!iceboat_mightve_lost] run function projektredstoneworld:rtciceboat/iceboatplayernotloser
execute as @p[tag=iceboat_time_tracked] unless entity @p[tag=iceboat_time_tracked, tag=!iceboat_mightve_lost] if entity @a[tag=iceboat_finished] run tellraw @a [{"text":"[IceBoat] ","color":"dark_aqua"},{"selector":"@p[tag=iceboat_time_tracked]"},{"text":" has finished the track in LAST PLACE in roughly "},{"score":{"name":"@s","objective":"iceboat_time"}}, {"text":" seconds! (exactly "},{"score":{"name":"@s","objective":"iceboat_tick"}},{"text":" ticks). What a loser!"}]
execute as @p[tag=iceboat_time_tracked] unless entity @a[tag=iceboat_finished] unless entity @p[tag=iceboat_time_tracked, tag=!iceboat_mightve_lost] run tellraw @a [{"text":"[IceBoat] ","color":"dark_aqua"},{"selector":"@p[tag=iceboat_time_tracked]"},{"text":" has finished the track in roughly "},{"score":{"name":"@s","objective":"iceboat_time"}}, {"text":" seconds! (exactly "},{"score":{"name":"@s","objective":"iceboat_tick"}},{"text":" ticks)."}]
tag @a[tag=iceboat_mightve_lost] remove iceboat_mightve_lost

# Cleanup
tag @p[tag=iceboat_time_tracked] add iceboat_finished
execute unless entity @a[tag=iceboat_time_tracked, tag=!iceboat_finished] run tag @a[tag=iceboat_finished] remove iceboat_finished
scoreboard players reset @p[tag=iceboat_time_tracked] iceboat_tick
scoreboard players reset @p[tag=iceboat_time_tracked] iceboat_time
tag @p[tag=iceboat_time_tracked] remove iceboat_time_tracked
execute unless entity @a[tag=iceboat_time_tracked] run scoreboard players set @a iceboat_position 0
