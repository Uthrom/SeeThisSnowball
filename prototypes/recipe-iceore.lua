if mods['IceOre'] then
  local snowballIceOreRecipe = {
    type = "recipe",
    name = "ice-ore-snowball",
    enabled = true,
    energy_required = 4,
    ingredients =
    {
      { type="item", name="ice-ore", amount=1}
    },
    result = "snowball",
    result_amount = 1
  }

  local iceore = table.deepcopy(data.raw['item']['ice-ore'])
  if iceore then
    data:extend({snowballIceOreRecipe})
  end
end
