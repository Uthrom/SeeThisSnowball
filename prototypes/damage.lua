local SnowballDamage = table.deepcopy(data.raw['damage-type']['impact'])

SnowballDamage.name = "snowball"

data:extend({SnowballDamage})


