return {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		local oil = require("oil")

		oil.setup({
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true
			},
			win_options = {
				wrap = true,
			}
		})

		-- Oil Command for replacement of netrw
		vim.api.nvim_create_user_command("Ex", function()
			oil.open()
		end, { desc = "Open file explorer (oil)" })

		vim.api.nvim_create_user_command("Vex", function()
			vim.cmd("vsplit")
			oil.open()
		end, { desc = "Open oil in vertical split" })

		vim.api.nvim_create_user_command("Sex", function()
			vim.cmd("split")
			oil.open()
		end, { desc = "Open oil in split" })

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

		-- for the similarity of file-tree
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Explorer" })

		-- Split windows for oil
		vim.keymap.set("n", "<leader>bs", "<cmd>split | Oil<cr>", { desc = "Split buffer" })
		vim.keymap.set("n", "<leader>bv", "<cmd>vsplit | Oil<cr>", { desc = "Vertical split buffer" })
	end
}
