local event_callbacks = {}

local function teleport(entity, dest, r)
  local surface = entity.surface
  local pos = { math.random(dest.x - r, dest.x + r), math.random(dest.y - r, dest.y + r) }
  local dst = surface.find_non_colliding_position("character", pos, 8, 2)

  if not dst then
    entity.teleport(destination)
  else
    entity.teleport(dst)
  end
end

function event_callbacks.on_entity_damaged (event)
  if not event.entity.valid then
    return
  end

  if event.damage_type.name == "snowball" then
    local s_dist = settings.global['snowball-tp-distance'].value
    local s_vehicles = settings.global['snowball-allow-vehicles'].value
    local s_biters   = settings.global['snowball-allow-biters'].value
    local s_entities = settings.global['snowball-allow-entities'].value

    if event.entity.type == "character" and event.entity.player.is_player() then
        teleport(event.entity, event.entity.position, s_dist)
    elseif event.entity.type == "car" and s_vehicles == true then
        teleport(event.entity, event.entity.position, s_dist)
    elseif event.entity.type == "unit" and s_biters == true then
        teleport(event.entity, event.entity.position, s_dist)
--    else
--      log(serpent.block(event.entity.type))
    end

    event.entity.damage( event.final_damage_amount * -1, event.entity.force, "impact")
  end
end 

function event_callbacks.on_trigger_created_entity (event)
  if not event.entity.valid then
    return
  else 
    event.entity.destroy()
  end
end

return event_callbacks
