return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			preview_config = {
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			}
		})

		-- Git preview commands
		vim.keymap.set("n", "<leader>gph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
		vim.keymap.set("n", "<leader>gpr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
		vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle blame" })
	end
}
