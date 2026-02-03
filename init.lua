-- Defaults Settings
require("defaults")

-- Core Utils
require("cleanvim.core")

-- Plugin manager
require("cleanvim.lazy")

-- UI
require("cleanvim.ui")

-- Custom Setting
local ok, err = pcall(require, "cleanvim.custom")
if not ok and err then
	print("Error: " .. err)
end
