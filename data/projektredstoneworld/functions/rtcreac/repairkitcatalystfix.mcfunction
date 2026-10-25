# Everything's alright! here comes the night
scoreboard players set #rtcreactorcoretemptarget info 100
scoreboard players set #rtcreactorcoretemp info 100
scoreboard players set #rtcreactorwaterpressuretarget info 17000
scoreboard players set #rtcreactorwaterpressure info 17000
scoreboard players set #rtcreactortitcover info 0
function projektredstoneworld:rtcreac/autoscram
scoreboard players set #rtcreactorrcbhp info 696969
scoreboard players set #rtcreactorfuelhp info 314159
scoreboard players set #rtcreactorlimbo info 0

kill @a[x=117,y=-41,z=720,dx=64,dy=24,dz=213]
# Clone repaired turbine hall to top
forceload add 117 720 181 933
gamerule commandModificationBlockLimit 500000
execute in overworld run clone 117 -16 720 181 8 933 117 12 720
forceload remove 117 720 181 933
gamerule commandModificationBlockLimit 32768


tellraw @a [{"text":"[","color":"#FFFF00","bold":true},{"text":"skibidi","obfuscated":true},{"text":"]","obfuscated":false},{"text":" The reactor structure has been restored.","bold":false,"obfuscated":false}]
