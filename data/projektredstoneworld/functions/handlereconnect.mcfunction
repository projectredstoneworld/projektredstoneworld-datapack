
# Handle reconnect for reborn museum lock
tag @s remove rebornxfragwatcher
tag @s remove rebornxfoundfrag

# Minigame Center / Tag down below
# Keep things like usual if tag is going on
execute if entity @s[tag=pontoka] unless score #tagstatus info matches 2..3 run function projektredstoneworld:rtctag/reconnectlate

# Clear reconnect status
scoreboard players reset @s rtcreconnect
