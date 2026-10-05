local M = {}

local toggle_formatting_on_save = function()

	vim.g.format_on_save = not vim.g.format_on_save
	require("cleanvim.config.state").set("format_on_save", vim.g.format_on_save)
	print("Format on save: " .. (vim.g.format_on_save and "on" or "off"))
end

vim.keymap.set("n", "<leader>tfs", function()
	toggle_formatting_on_save()
end, { desc = "toggle formatting on save" })

return M
