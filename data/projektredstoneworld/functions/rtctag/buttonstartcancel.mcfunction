execute if score #tagstatus info matches 0 run function projektredstoneworld:rtctag/buttonstart
execute if score #tagstatus info matches 1..3 run function projektredstoneworld:rtctag/buttoncancel
execute if score #tagstatus info matches -1 run scoreboard players set #tagstatus info 1
execute if score #tagstatus info matches 1 run schedule function projektredstoneworld:rtctag/init 200t
