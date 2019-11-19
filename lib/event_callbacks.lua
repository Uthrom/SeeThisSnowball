local event_callbacks = {}

local function teleport(player, destination, r)
    local surface = player.surface
    local pos = { math.random(destination.x - r, destination.x + r), math.random(destination.y - r, destination.y + r) }
    local dst = surface.find_non_colliding_position("character", pos, 8, 2)

    if not dst then
      player.teleport(destination, surface)
    else
      player.teleport(dst, surface)
    end
end

function event_callbacks.on_entity_damaged (event)
--  log("on_entity_damaged called")

  if not event.entity.valid then
    return
  end

  if event.damage_type.name == "snowball" and event.entity.type == "character" and event.cause.type == "character" and event.entity.player.valid then
    teleport(event.entity.player, event.entity.position, 50)
  end

  event.entity.damage( -1, event.entity.force, "impact")
end 

function event_callbacks.on_trigger_created_entity (event)
--  log("on_trigger_created_entity called")

  if not event.entity.valid then
    return
  else 
    event.entity.destroy()
  end
end

return event_callbacks
