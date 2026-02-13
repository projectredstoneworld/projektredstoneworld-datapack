data merge entity @e[type=text_display,limit=1,tag=vaultdispdiamond] {text:'[{"text":"Diamonds","color":"aqua"},{"text":"\\n"},{"score":{"name":"#rtcdiamonds","objective":"info"},"color":"aqua"}]'}
data merge entity @e[type=text_display,limit=1,tag=vaultdispgold] {text:'[{"text":"Gold","color":"gold"},{"text":"\\n"},{"score":{"name":"#rtcgold","objective":"info"},"color":"gold"}]'}
data merge entity @e[type=text_display,limit=1,tag=vaultdispemerald] {text:'[{"text":"Emeralds","color":"green"},{"text":"\\n"},{"score":{"name":"#rtcemeralds","objective":"info"},"color":"green"}]'}
data merge entity @e[type=text_display,limit=1,tag=vaultdispstar] {text:'[{"text":"Nether Stars","color":"#aa92ff"},{"text":"\\n"},{"score":{"name":"#rtcstars","objective":"info"},"color":"#aa92ff"}]'}

scoreboard players operation #totalvaultfund info = #rtcgold info
scoreboard players operation #rtcadjem info = #rtcemeralds info
scoreboard players operation #rtcadjem info *= 4 CONSTANTS
scoreboard players operation #totalvaultfund info += #rtcadjem info
scoreboard players operation #rtcadjdia info = #rtcdiamonds info
scoreboard players operation #rtcadjdia info *= 2 CONSTANTS
scoreboard players operation #totalvaultfund info += #rtcadjdia info
scoreboard players operation #rtcadjstar info = #rtcstars info
scoreboard players operation #rtcadjstar info *= 64 CONSTANTS
scoreboard players operation #totalvaultfund info += #rtcadjstar info
scoreboard players operation #totalvaultfund info /= 40 CONSTANTS
scoreboard players reset #rtcadjstar
scoreboard players reset #rtcadjdia
scoreboard players reset #rtcadjem

data merge entity @e[type=text_display,limit=1,tag=rtcvaultdisptot] {text:'[{"text":"Total Value in Vault:","color":"gold","bold":true},{"text":"\\n$","color":"green","bold":true},{"score":{"name":"#totalvaultfund","objective":"info"},"color":"green","bold":true},{"text":"K","color":"green","bold":true}]'}