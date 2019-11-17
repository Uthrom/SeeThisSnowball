local snowballRecipe = {
    type = "recipe",
    name = "snowball",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 4,
    ingredients =
    {
      {type="fluid", name="water", amount=4}
    },
    result = "snowball",
    result_count = 1
  }

data:extend({snowballRecipe})
