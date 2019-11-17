
script.on_event(defines.events.on_entity_damaged, function(event)
  if event.entity.name == fieldDamagedTriggerName then
    local position = event.entity.position
    local surface = event.entity.surface
    event.entity.destroy()
    onForcefieldDamaged(surface, position)
  end
end)

