local Events = {}

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

function Events.Init (e)
  local damage_filter = {{filter='type', type='character'}}

  if global.Mod.SnowballAllowVehicles == true then
    table.insert(damage_filter, {filter='type', type='car'})
  end

  if global.Mod.SnowballAllowBiters == true then
    table.insert(damage_filter, {filter='type', type='unit'})
   end

  script.on_event( defines.events.on_entity_damaged, 
                   Events._damaged_entity, 
                   damage_filter )

  script.on_event( defines.events.on_trigger_created_entity,
                   Events.on_trigger_created_entity )
end

function Events._damaged_entity (event)
  if not event.entity.valid then
    return
  end

  if not event.damage_type.name == "snowball" then
    return
  end

  if global.Mod.SnowballAllowSelf == false and event.entity == event.cause then
    return
  end

  teleport(event.entity, event.entity.position, global.Mod.SnowballTPDistance)
  event.entity.damage( event.final_damage_amount * -1, event.entity.force, "snowball")

end

function Events.on_trigger_created_entity (event)
  if not event.entity.valid then
    return
  else 
    event.entity.destroy()
  end
end

return Events
