local Constants = require("constants")
data:extend(
{
  {
    type = "technology",
    name = "snowball",
    icon_size = 64,
    icon = Constants.AssetModName .. "/graphics/technology/snowball.png",
    enabled = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "snowball"
      }
    },
    unit =
    {
      count = 1,
      ingredients = {{"automation-science-pack", 1}},
      time = 1
    },
    order = "c-a"
  }
})
