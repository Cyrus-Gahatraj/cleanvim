-- Oil Command for replacement of netrw
vim.api.nvim_create_user_command("Ex", function()
	require("oil").open()
end, { desc = "Open file explorer (oil)" })

vim.api.nvim_create_user_command("Vex", function()
	vim.cmd("vsplit")
	require("oil").open()
end, { desc = "Open oil in vertical split" })

vim.api.nvim_create_user_command("Sex", function()
	vim.cmd("split")
	require("oil").open()
end, { desc = "Open oil in split" })

