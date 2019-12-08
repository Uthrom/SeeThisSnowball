data:extend({
  {
    name = "snowball-tp-distance",
    type = "int-setting",
    setting_type = "runtime-global",
    default_value = 50,
    minimum_value = 1,
    maximum_value = 200,
    order = "1101"
  },

  {
    name = "snowball-special-attack",
    type = "string-setting",
    setting_type = "runtime-global",
    default_value = "JD-Plays",
    allow_blank = true,
    order = "1102"
  },

  {
    name = "snowball-allow-self",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = true,
    order = "1103"

  },

 {
    name = "snowball-allow-biters",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false,
    order = "1104"
  },

  {
    name = "snowball-allow-vehicles",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false,
    order = "1105"
  },

  {
    name = "snowball-allow-entities",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false,
    order = "1106"
  }
})

