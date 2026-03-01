tag @s add handlePodTimeOut

# Keep pod from timing out if it hasn't left the station yet, the stationmsg function will handle pod deletion at stations. May keep this off for now
# execute if entity @s[tag=!rcrailaged] run scoreboard players operation @s rcrailtimer = #servertimer rcrailtimer

# If the pod has a rider, prevent timeout and update the timer to the current server time
execute as @e[type=pig,tag=rcrailseat,x=0] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handlePodTimeOut,limit=1,sort=nearest] redstoneworldID at @s on passengers if entity @s[tag=rcrailrider,scores={rcrailpay=1..}] on vehicle run scoreboard players operation @e[type=minecart,tag=rcraildrive,tag=handlePodTimeOut,limit=1,sort=nearest] rcrailtimer = #servertimer rcrailtimer
# Set seat time to pod time since seat can get deattached
execute as @e[type=pig,tag=rcrailseat,x=0] if score @s redstoneworldID = @e[type=minecart,tag=rcraildrive,tag=handlePodTimeOut,limit=1,sort=nearest] redstoneworldID at @s run scoreboard players operation @s rcrailtimer = @e[type=minecart,tag=rcraildrive,tag=handlePodTimeOut,limit=1,sort=nearest] rcrailtimer

scoreboard players operation @s rcrailtimerdiff = #servertimer rcrailtimer
scoreboard players operation @s rcrailtimerdiff -= @s rcrailtimer

tag @s remove handlePodTimeOut
tag @s add handledPodTimeOut

# Recursion for each pod, handle the rest in schedule now
execute in overworld as @e[type=minecart,tag=rcraildrive,x=0,tag=!handledPodTimeOut,limit=1,sort=random] at @s run function projektredstoneworld:rcrailtransit/podtimeout
