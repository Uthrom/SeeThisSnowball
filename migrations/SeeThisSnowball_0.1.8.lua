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

CreateGlobals()
GetStartUpSettings()

