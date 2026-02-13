execute positioned ~ ~1 ~ if block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["lantern_block"]}
execute positioned ~ ~1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ light[level=15]

### 4-cross pad
execute positioned ~1 ~1 ~ if block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["lantern_block"]}
execute positioned ~1 ~1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ light[level=14]
execute positioned ~-1 ~1 ~ if block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["lantern_block"]}
execute positioned ~-1 ~1 ~ if block ~ ~ ~ air run setblock ~ ~ ~ light[level=14]
execute positioned ~ ~1 ~1 if block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["lantern_block"]}
execute positioned ~ ~1 ~1 if block ~ ~ ~ air run setblock ~ ~ ~ light[level=14]
execute positioned ~ ~1 ~-1 if block ~ ~ ~ air run summon marker ~ ~ ~ {Tags:["lantern_block"]}
execute positioned ~ ~1 ~-1 if block ~ ~ ~ air run setblock ~ ~ ~ light[level=14]