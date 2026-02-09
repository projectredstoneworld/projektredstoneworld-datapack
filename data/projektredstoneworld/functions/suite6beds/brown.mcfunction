fill -118 99 520 -119 99 521 air
fill -118 99 521 -119 99 521 brown_bed[facing=south,part=head]
fill -118 99 520 -119 99 520 brown_bed[facing=south,part=foot]
execute positioned -118.08 99.56 521.40 run kill @e[type=item,distance=..3]
fill -136 99 509 -137 99 510 air replace #minecraft:beds
fill -136 99 509 -136 99 510 brown_bed[facing=east,part=head] replace air
fill -137 99 509 -137 99 510 brown_bed[facing=east,part=foot] replace air
execute positioned -136 99 510 run kill @e[type=item,distance=..3]
fill -143 58 500 -144 58 501 air replace #minecraft:beds
fill -143 58 500 -143 58 501 brown_bed[facing=east,part=head] replace air
fill -144 58 500 -144 58 501 brown_bed[facing=east,part=foot] replace air
execute positioned -144 58 500 run kill @e[type=item,distance=..3]