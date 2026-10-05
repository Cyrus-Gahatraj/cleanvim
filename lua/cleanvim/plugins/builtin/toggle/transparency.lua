local M = {}

local toggle_transparency = function()

	vim.g.transparency = not vim.g.transparency
	require("cleanvim.config.state").set("transparency", vim.g.transparency)
	-- reloading the colorscheme re-applies (or drops) transparency
	vim.cmd.colorscheme(vim.g.colors_name)
end

vim.keymap.set("n", "<leader>tiv", function()
	toggle_transparency()
end, { desc = "toggle invisibility" })

return M
