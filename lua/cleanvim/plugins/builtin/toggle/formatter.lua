local M = {}

local toggle_formatting_on_save = function()

    local save = require("cleanvim.plugins.builtin.save_state")
	vim.g.format_on_save = not vim.g.format_on_save
	local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/format_on_save.lua"
	save({
		path = path,
		return_state = string.format("return %s", vim.g.format_on_save),
	})
	print("Restart require")
end

vim.keymap.set("n", "<leader>tfs", function()
	toggle_formatting_on_save()
end, { desc = "toggle formatting on save" })

return M
