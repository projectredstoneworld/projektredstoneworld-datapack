fill -118 94 520 -119 94 521 air
fill -118 94 521 -119 94 521 lime_bed[facing=south,part=head]
fill -118 94 520 -119 94 520 lime_bed[facing=south,part=foot]
execute positioned -118.08 94.56 521.40 run kill @e[type=item,distance=..3]
fill -102 89 514 -103 89 513 air replace #minecraft:beds
fill -102 89 514 -103 89 514 lime_bed[facing=south,part=head] replace air
fill -102 89 513 -103 89 513 lime_bed[facing=south,part=foot] replace air
execute positioned -102 89 514 run kill @e[type=item,distance=..3]
fill -99 57 506 -100 57 505 air replace #minecraft:beds
fill -99 57 506 -100 57 506 lime_bed[facing=south,part=head] replace air
fill -99 57 505 -100 57 505 lime_bed[facing=south,part=foot] replace air
execute positioned -99 57 506 run kill @e[type=item,distance=..3]