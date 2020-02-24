local Events = require("lib.events")

local function CreateGlobals()
  if global.Mod == nil then
    global.Mod = {}
  end

  if global.Mod.SnowballTPDistance == nil then
    global.Mod.SnowballTPDistance = 50
  end

  if global.Mod.SnowballSpecialAttack == nil then
    global.Mod.SnowballSpecialAttack = {}
  end

  if global.Mod.SnowballAllowBiters == nil then
    global.Mod.SnowballAllowBiters = false
  end

  if global.Mod.SnowballAllowVehicles == nil then
    global.Mod.SnowballAllowVehicles = false
  end

  if global.Mod.SnowballAllowEntities == nil then
    global.Mod.SnowballAllowEntitie = false
  end

  if global.Mod.SnowballAllowSelf == nil then
    global.Mod.SnowballAllowSelf = true
  end
end

local function GetStartUpSettings()
  global.Mod.SnowballTPDistance = settings.global['snowball-tp-distance'].value
  global.Mod.SnowballAllowBiters = settings.global['snowball-allow-biters'].value
  global.Mod.SnowballAllowVehicles = settings.global['snowball-allow-vehicles'].value
  global.Mod.SnowballAllowEntities = settings.global['snowball-allow-entities'].value
  global.Mod.SnowballAllowSelf = settings.global['snowball-allow-self'].value

  global.Mod.SnowballSpecialAttack = {}
  for match in string.gmatch(settings.global['snowball-special-attack'].value, "[^, ]+") do
    table.insert(global.Mod.SnowballSpecialAttack, match)
  end
end

local function UpdateSetting(settingName)
  if settingName == "snowball-tp-distance" then
    global.Mod.SnowballTPDistance = settings.global['snowball-tp-distance'].value
  end
  if settingName == "snowball-allow-biters" then
    global.Mod.SnowballAllowBiters = settings.global['snowball-allow-biters'].value
  end

  if settingName == "snowball-allow-vehicles" then
    global.Mod.SnowballAllowVehicles = settings.global['snowball-allow-vehicles'].value
  end

  if settingName == "snowball-allow-self" then
    global.Mod.SnowballAllowSelf = settings.global['snowball-allow-self'].value
  end

  if settingName == "snowball-allow-entities" then
    global.Mod.SnowballAllowEntities = settings.global['snowball-allow-entities'].value
  end

  if settingName == "snowball-special-attack" then
    global.Mod.SnowballSpecialAttack = {}
    for match in string.gmatch(settings.global['snowball-special-attack'].value, "[^, ]+") do
      table.insert(global.Mod.SnowballSpecialAttack, match)
    end
  end
end

local function OnStartup()
  CreateGlobals()
  GetStartUpSettings()
  Events.Init()
end

local function OnSettingChanged(event)
  UpdateSetting(event.setting)
  Events.Init()
end

local function OnLoad()
  Events.Init()
end

script.on_init(OnStartup)
script.on_load(OnLoad)
script.on_configuration_changed(OnStartup)
script.on_event(defines.events.on_runtime_mod_setting_changed, OnSettingChanged)
