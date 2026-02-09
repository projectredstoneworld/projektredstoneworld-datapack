tag @s remove rcrailsubcheck
execute at @s as @e[type=marker,tag=rcrail_marker] if score @s redstoneworldID = @p redstoneworldID unless score @s rcrailmonths matches 1.. run return run tellraw @p {"text":"You have no pending RCorp Rail purchases","color":"green"}


execute at @s as @e[type=marker,tag=rcrail_marker] if score @s redstoneworldID = @p redstoneworldID if score @s rcrailmonths matches 1.. run scoreboard players operation @p rcrailmonths = @s rcrailmonths
execute at @s as @e[type=marker,tag=rcrail_marker] if score @s redstoneworldID = @p redstoneworldID run scoreboard players set @s rcrailmonths 0


scoreboard players operation @s rcraildebt = @s rcrailmonths
execute if score @s rcrailpay matches 1 run scoreboard players operation @s rcraildebt *= 200 CONSTANTS
execute if score @s rcrailpay matches 2 run scoreboard players operation @s rcraildebt *= 180 CONSTANTS
execute if score @s rcrailpay matches 3 run scoreboard players operation @s rcraildebt *= 160 CONSTANTS
tellraw @s [{"text":"You have a pending purchase of $","color":"green"},{"score":{"name":"@s","objective":"rcraildebt"},"color":"green","bold": true},{"text":" for ","color":"green"},{"score": {"name":"@s","objective": "rcrailmonths"},"color": "green","bold": true},{"text":" in-game months of RCorp Rail subscription service. Processing autorenewal...","color":"green"}]
execute if score @s rcrailmonths matches 1.. run tag @s add rcraildebt
execute if score @s rcrailmonths matches 1.. run schedule function projektredstoneworld:processrcrailsub 5t
