local M = {}

local save = require("cleanvim.plugins.builtin.switchers.save_state")

local switch_transparency = function()
	vim.g.transparency = not vim.g.transparency
	local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/transparency.lua"
	save({
		path = path,
		return_state = string.format("return %s", vim.g.transparency),
	})
	print("Require a restart")
end

vim.keymap.set("n", "<leader>str", function()
	switch_transparency()
end, { desc = "switch transparency" })

local ok, wk = pcall(require, "which-key")
if ok and wk.add then
    wk.add({ { "<leader>s", group = "Switch stuffs" } })
end

return M
