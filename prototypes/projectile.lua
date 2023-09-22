local Constants = require("constants")

  local snowballProjectile = {
    type = "projectile",
    name = "snowball",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "snowball",
              check_buildability = true,
              trigger_created_entity = "true"
            }
          }
        }
      },
      {
        type = "area",
        radius = 1,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
            type = "damage",
            damage = {amount = 1, type = "snowball"}
--            },
--             {
--            type = "create-entity",
--            entity_name = "explosion"
            }
          }
        }
      }
    },
    light = {intensity = 0, size = 4},
    animation =
    {
      filename = Constants.AssetModName .. "/graphics/projectile/snowball.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    }
  }

  data:extend({snowballProjectile})
