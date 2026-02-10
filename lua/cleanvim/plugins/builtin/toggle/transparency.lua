local M = {}

local save = require("cleanvim.plugins.builtin.save_state")

local toggle_transparency = function()
	vim.g.transparency = not vim.g.transparency
	local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/transparency.lua"
	save({
		path = path,
		return_state = string.format("return %s", vim.g.transparency),
	})
	print("Require a restart")
end

vim.keymap.set("n", "<leader>ttp", function()
	toggle_transparency()
end, { desc = "switch transparency" })

return M
