execute if score #tagstatus info matches 0 run function projektredstoneworld:rtctag/buttonstart
execute unless score #tagstatus info matches 0 run function projektredstoneworld:rtctag/buttoncancel
execute if score #tagstatus info matches -1 run scoreboard players set #tagstatus info 1
