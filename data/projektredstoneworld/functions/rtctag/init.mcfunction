# Runs when head start begins

scoreboard players set #tagstatus info 2
scoreboard players operation #tagtimer info = #taghead info
execute if score #taghead info matches 10.. run scoreboard players operation #tagtimer info *= 1000 CONSTANTS
execute if score #taghead info matches ..9 run scoreboard players operation #tagtimer info *= 60000 CONSTANTS

function projektredstoneworld:rtctag/tagschedule
