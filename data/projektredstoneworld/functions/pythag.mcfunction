# Inputs: #pythagx #pythagy #pythagz INPUTS VALUES ARE DESTROYED, Output in #sqrt

scoreboard players operation #pythagx info *= #pythagx info
scoreboard players operation #pythagy info *= #pythagy info
scoreboard players operation #pythagz info *= #pythagz info

scoreboard players operation #pythagz info += #pythagy info
scoreboard players operation #pythagx info += #pythagz info
scoreboard players operation #sqrtin info = #pythagx info

function projektredstoneworld:sqrt
