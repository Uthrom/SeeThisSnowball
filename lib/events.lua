local Events = {}

local function teleport(entity, dest, r)
  local enemy = nil
  local surface = entity.surface
  local dst = dest
  local pos = { math.random(dest.x - r, dest.x + r), math.random(dest.y - r, dest.y + r) }

  log("Starting pos: " .. dst.x .. ", " .. dst.y)
  if entity.type == "character" then
    if entity.player ~= nil then
      for _, v in pairs(storage.Mod.SnowballSpecialAttack) do
        if entity.player.name == v then
          enemy = surface.find_nearest_enemy{position=pos, max_distance=2000, force=entity.force}
          break
        end
      end
    end
  end

  if enemy ~= nil then
    dst = surface.find_non_colliding_position("character", enemy.position, 8, 2)
  else 
    dst = surface.find_non_colliding_position("character", pos, 8, 2)
  end

  if not dst then
    entity.teleport(dest)
  else
    entity.teleport(dst)
  end
end

function Events.Init (e)
  local damage_filter = {{filter='type', type='character'}}

  if storage.Mod.SnowballAllowVehicles == true then
    table.insert(damage_filter, {filter='type', type='car'})
  end

  if storage.Mod.SnowballAllowBiters == true then
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

  if event.damage_type ~= nil and (event.damage_type.name ~= "snowball") then
    return
  end

--  if event.cause ~= nil and event.entity ~= nil then
--    log("Damage: " .. event.cause.name .. " -> " .. event.entity.name .. ": " .. event.final_damage_amount)
--  elseif event.cause == nil and event.entity ~= nil then
--    log("Damage: NULL -> " .. event.entity.name .. ": " .. event.final_damage_amount)
--  elseif event.cause ~= nil and event.entity == nil then
--    log("Damage: " .. event.cause.name .. " -> NULL: " .. event.final_damage_amount)
--  else
--    log("Damage: NULL -> NULL: " .. event.final_damage_amount)
--  end

  if (storage.Mod.SnowballAllowSelf == false) and (event.entity == event.cause) then
    event.entity.damage( math.abs(event.original_damage_amount) * -1, event.entity.force, "snowball")
    return
  end

  teleport(event.entity, event.entity.position, storage.Mod.SnowballTPDistance)
  event.entity.damage( math.abs(event.original_damage_amount) * -1, event.entity.force, event.damage_type.name)
end

function Events.on_trigger_created_entity (event)
  if event.entity.valid then
--    log("on_trigger_created_entity: " .. event.entity.name)
    if event.entity.name == "snowball" then
      event.entity.destroy()
    end
  end
end

return Events
