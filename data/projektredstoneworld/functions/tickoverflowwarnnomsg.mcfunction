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