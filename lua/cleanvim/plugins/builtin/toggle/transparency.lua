local M = {}

local toggle_transparency = function()

	vim.g.transparency = not vim.g.transparency
	require("cleanvim.config.state").set("transparency", vim.g.transparency)
	print("Require a restart")
end

vim.keymap.set("n", "<leader>tiv", function()
	toggle_transparency()
end, { desc = "toggle invisibility" })

return M
