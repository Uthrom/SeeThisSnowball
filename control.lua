local Events = require("lib.events")

local function Createstorages()
  if storage.Mod == nil then
    storage.Mod = {}
  end

  if storage.Mod.SnowballTPDistance == nil then
    storage.Mod.SnowballTPDistance = 50
  end

  if storage.Mod.SnowballSpecialAttack == nil then
    storage.Mod.SnowballSpecialAttack = {}
  end

  if storage.Mod.SnowballAllowBiters == nil then
    storage.Mod.SnowballAllowBiters = false
  end

  if storage.Mod.SnowballAllowVehicles == nil then
    storage.Mod.SnowballAllowVehicles = false
  end

  if storage.Mod.SnowballAllowEntities == nil then
    storage.Mod.SnowballAllowEntitie = false
  end

  if storage.Mod.SnowballAllowSelf == nil then
    storage.Mod.SnowballAllowSelf = true
  end
end

local function GetStartUpSettings()
  storage.Mod.SnowballTPDistance = settings.global['snowball-tp-distance'].value
  storage.Mod.SnowballAllowBiters = settings.global['snowball-allow-biters'].value
  storage.Mod.SnowballAllowVehicles = settings.global['snowball-allow-vehicles'].value
  storage.Mod.SnowballAllowEntities = settings.global['snowball-allow-entities'].value
  storage.Mod.SnowballAllowSelf = settings.global['snowball-allow-self'].value

  storage.Mod.SnowballSpecialAttack = {}
  for match in string.gmatch(settings.global['snowball-special-attack'].value, "[^, ]+") do
    table.insert(storage.Mod.SnowballSpecialAttack, match)
  end
end

local function UpdateSetting(settingName)
  if settingName == "snowball-tp-distance" then
    storage.Mod.SnowballTPDistance = settings.global['snowball-tp-distance'].value
  end
  if settingName == "snowball-allow-biters" then
    storage.Mod.SnowballAllowBiters = settings.global['snowball-allow-biters'].value
  end

  if settingName == "snowball-allow-vehicles" then
    storage.Mod.SnowballAllowVehicles = settings.global['snowball-allow-vehicles'].value
  end

  if settingName == "snowball-allow-self" then
    storage.Mod.SnowballAllowSelf = settings.global['snowball-allow-self'].value
  end

  if settingName == "snowball-allow-entities" then
    storage.Mod.SnowballAllowEntities = settings.global['snowball-allow-entities'].value
  end

  if settingName == "snowball-special-attack" then
    storage.Mod.SnowballSpecialAttack = {}
    for match in string.gmatch(settings.global['snowball-special-attack'].value, "[^, ]+") do
      table.insert(storage.Mod.SnowballSpecialAttack, match)
    end
  end
end

local function OnStartup()
  Createstorages()
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
