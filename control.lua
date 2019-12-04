event_callbacks = require("lib.event_callbacks")

event_callbacks.Init()

script.on_event(defines.events.on_runtime_mod_setting_changed, event_callbacks.Init)


