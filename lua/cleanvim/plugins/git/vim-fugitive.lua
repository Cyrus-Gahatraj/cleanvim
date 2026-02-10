return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })
		vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "Git diff" })
		vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
		vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<CR>", { desc = "Git add this" })
		vim.keymap.set("n", "<leader>gpu", "<cmd>Git push<CR>", { desc = "Git Push" })
		vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>", { desc = "Git Pull" })
	end
}
