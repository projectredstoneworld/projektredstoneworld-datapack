scoreboard players set #timeleftuntilof info 2147483647
execute store result score #rwgametimeof info run time query gametime
scoreboard players operation #timeleftuntilof info -= #rwgametimeof info

execute if score #timeleftuntilof info matches 80000000.. if score #forceofwarning info matches 0 run return fail

scoreboard players operation #timeleftuntilof info /= 20 CONSTANTS
scoreboard players operation #secsleftuntilof info = #timeleftuntilof info
scoreboard players operation #secsleftuntilof info %= 60 CONSTANTS

scoreboard players operation #timeleftuntilof info /= 60 CONSTANTS
scoreboard players operation #minsleftuntilof info = #timeleftuntilof info
scoreboard players operation #minsleftuntilof info %= 60 CONSTANTS

scoreboard players operation #timeleftuntilof info /= 60 CONSTANTS
scoreboard players operation #hoursleftuntilof info = #timeleftuntilof info
scoreboard players operation #hoursleftuntilof info %= 24 CONSTANTS

scoreboard players operation #timeleftuntilof info /= 24 CONSTANTS
scoreboard players operation #daysleftuntilof info = #timeleftuntilof info

execute if score #rwgametimeof info matches ..2067483647 run tellraw @a[tag=admin] [{"text":"Time until gametime overflow: ", "color":"#AAAAAA"}, {"score":{"name":"#daysleftuntilof","objective":"info"}},{"text":"d "},{"score":{"name":"#hoursleftuntilof","objective":"info"}},{"text":"h "},{"score":{"name":"#minsleftuntilof","objective":"info"}},{"text":"m "},{"score":{"name":"#secsleftuntilof","objective":"info"}},{"text":"s"}]
execute if score #rwgametimeof info matches 2067483648..2132483647 run tellraw @a[tag=admin] [{"text":"WARNING: Time until gametime overflow: ", "color":"red","bold":true}, {"score":{"name":"#daysleftuntilof","objective":"info"}},{"text":"d "},{"score":{"name":"#hoursleftuntilof","objective":"info"}},{"text":"h "},{"score":{"name":"#minsleftuntilof","objective":"info"}},{"text":"m "},{"score":{"name":"#secsleftuntilof","objective":"info"}},{"text":"s"}]
execute if score #rwgametimeof info matches 2132483648.. run tellraw @a[tag=admin] [{"text":"CRITICAL WARNING: Time until gametime overflow: ", "color":"red","bold":true}, {"score":{"name":"#daysleftuntilof","objective":"info"}},{"text":"d "},{"score":{"name":"#hoursleftuntilof","objective":"info"}},{"text":"h "},{"score":{"name":"#minsleftuntilof","objective":"info"}},{"text":"m "},{"score":{"name":"#secsleftuntilof","objective":"info"}},{"text":"s"}]
