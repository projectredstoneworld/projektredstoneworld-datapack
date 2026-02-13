execute at @s unless score @s rcrailpay matches 1.. unless score @s rcorpsec matches 1.. run tellraw @s {"text":"Automatically signing you up for RCorp Rail to allow access to trains. Costs 2 emeralds per in game month. Cancel at Tower 3. (you can get a discount if you sign up with an RCorp Level!)","color":"green"}
execute at @s unless score @s rcrailpay matches 1.. if score @s rcorpsec matches 1 run tellraw @s {"text":"Automatically signing you up for RCorp Rail to allow access to trains. Applying 10% discount for level 1 RCorp status, now costs 1.8 emeralds per in game month. Cancel at Tower 3.","color":"green"}
execute at @s unless score @s rcrailpay matches 1.. if score @s rcorpsec matches 2 run tellraw @s {"text":"Automatically signing you up for RCorp Rail to allow access to trains. Applying 20% discount for level 2 RCorp status, now costs 1.6 emeralds per in game month. Cancel at Tower 3.","color":"green"}
execute at @s unless score @s rcrailpay matches 1.. if score @s rcorpsec matches 3.. run tellraw @s {"text":"Automatically signing you up for RCorp Rail to allow access to trains. Applying 100% discount for level 3+ RCorp status, now costs 0 emeralds per in game month. Cancel at Tower 3. Enjoy your free access!","color":"green"}
execute at @s unless score @s rcrailpay matches 1.. run scoreboard players enable @s rcrailpaytrig
scoreboard players set @s rcrailpaytrig 2
execute as @a[scores={rcrailpaytrig=2}] unless score @s rcorpsec matches 1.. run scoreboard players set @s rcrailpay 1
execute as @a[scores={rcrailpaytrig=2}] if score @s rcorpsec matches 1 run scoreboard players set @s rcrailpay 2
execute as @a[scores={rcrailpaytrig=2}] if score @s rcorpsec matches 2 run scoreboard players set @s rcrailpay 3
execute as @a[scores={rcrailpaytrig=2}] if score @s rcorpsec matches 3.. run scoreboard players set @s rcrailpay 4
execute as @a[scores={rcrailpaytrig=2}] unless score @s rcorpsec matches 3.. run function projektredstoneworld:creatercrailpay
execute as @a[scores={rcrailpaytrig=2}] if score @s rcrailpay matches 1..3 run setblock -260 41 391 minecraft:redstone_block
execute as @a[scores={rcrailpaytrig=2}] unless score @s rcrailpay matches 1..3 run scoreboard players reset @s rcrailpaytrig
