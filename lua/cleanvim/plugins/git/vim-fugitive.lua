return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G", "Gdiffsplit", "Gwrite", "Gread" },
	keys = {
		{ "<leader>gs", "<cmd>Git<CR>", desc = "Git Status" },
		{ "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git diff" },
		{ "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
		{ "<leader>gw", "<cmd>Gwrite<CR>", desc = "Git add this" },
		{ "<leader>gpu", "<cmd>Git push<CR>", desc = "Git Push" },
		{ "<leader>gpl", "<cmd>Git pull<CR>", desc = "Git Pull" },
	},
}
