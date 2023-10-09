local theme = "onenord"
local opts = {
  name = "onedark",
  flavor = "macchiato"

}

local _theme = require("themes." ..theme)
_theme.init(opts)
