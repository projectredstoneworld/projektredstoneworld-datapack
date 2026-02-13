scoreboard players reset @s rcrailpay
execute at @s as @e[type=marker,tag=rcrail_marker] if score @s redstoneworldID = @p redstoneworldID run kill @s
tellraw @s {"text":"RCorp Rail subscription has been cancelled. Rail access revoked. To use rails again please find a RCorp Rail Signup Station","color":"red"}