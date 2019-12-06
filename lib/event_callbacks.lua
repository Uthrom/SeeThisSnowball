local event_callbacks = {}

local function teleport(entity, dest, r)
  local surface = entity.surface
  local pos = { math.random(dest.x - r, dest.x + r), math.random(dest.y - r, dest.y + r) }
  local dst = surface.find_non_colliding_position("character", pos, 8, 2)

  if not dst then
    entity.teleport(dest)
  else
    entity.teleport(dst)
  end
end

function event_callbacks.Init (e)
  local s_vehicles = settings.global['snowball-allow-vehicles'].value
  local s_biters   = settings.global['snowball-allow-biters'].value
  local s_entities = settings.global['snowball-allow-entities'].value

  local damage_filter = {{filter='type', type='character'}}

  if s_vehicles == true then
    table.insert(damage_filter, {filter='type', type='car'})
  end

  if s_biters == true then
    table.insert(damage_filter, {filter='type', type='unit'})
   end

  script.on_event( defines.events.on_entity_damaged, 
                   event_callbacks._damaged_entity, 
                   damage_filter )

  script.on_event( defines.events.on_trigger_created_entity,
                   event_callbacks.on_trigger_created_entity )
end

function event_callbacks._damaged_entity (event)
  if not event.entity.valid then
    return
  end

  if not event.damage_type.name == "snowball" then
    return
  end

  local s_dist = settings.global['snowball-tp-distance'].value
  teleport(event.entity, event.entity.position, s_dist)
  event.entity.damage( event.final_damage_amount * -1, event.entity.force, "snowball")

end

function event_callbacks.on_trigger_created_entity (event)
  if not event.entity.valid then
    return
  else 
    event.entity.destroy()
  end
end

return event_callbacks
