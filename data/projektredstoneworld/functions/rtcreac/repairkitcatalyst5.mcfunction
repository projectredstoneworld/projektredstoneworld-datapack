# Called from command blocks at around 120 35 -50

execute unless score #rtcreactorspew info matches 710000000.. run tellraw @a [{"text":"RADIATION UPDATE\n","color":"#FF0000","bold":true},{"text":"A new report from RID suggests that the radiation around the FI-RTC complex remains extremely elevated, and it is therefore unsafe to exit the bunker systems. Please stay in a secure location until further notice.","bold":false}]
execute unless score #rtcreactorspew info matches 710000000.. run forceload add -118 63
execute unless score #rtcreactorspew info matches 710000000.. run setblock -118 27 63 redstone_block
execute if score #rtcreactorspew info matches 710000000.. run schedule function projektredstoneworld:rtcreac/repairkitcatalyst5 200t
