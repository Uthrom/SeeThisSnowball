local Constants = require("constants")

local snowballCapsule = {
    type = "capsule",
    name = "snowball",
    icon = Constants.AssetModName .. "/graphics/capsule/snowball.png",
    icon_size = 64,
    capsule_action =
    {
      type = "throw",
      --uses_stack = false,
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 15,
        ammo_type =
        {
          category = "grenade",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "snowball",
              starting_speed = 0.3
            }
          }
        }
      }
    },
    subgroup = "capsule",
    order = "a[snowball]-a[normal]",
    stack_size = 100
}

log(serpent.block(snowballCapsule))
data:extend({snowballCapsule})
