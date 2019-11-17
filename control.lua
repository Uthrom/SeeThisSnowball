event_callbacks = require("lib.event_callbacks")

script.on_event( defines.events.on_entity_damaged,
                 event_callbacks.on_entity_damaged )

script.on_event( defines.events.on_trigger_created_entity,
                 event_callbacks.on_trigger_created_entity )

