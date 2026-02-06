-- Defaults Settings
require("cleanvim.defaults")

-- Core Utils
require("cleanvim.core")

-- Plugin manager
require("cleanvim.lazy")

-- UI
require("cleanvim.ui")

-- Custom Setting
pcall(require, "cleanvim.custom")
