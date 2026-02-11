return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			local telescope = require('telescope')

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                        },
                    },
                },
                extensions = {
					fzf = {}
				},
			})

            telescope.load_extension('fzf')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
			vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git file' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
			vim.keymap.set('n', '<leader>fc', function()
                builtin.find_files { cwd = vim.fn.stdpath("config") }
            end, { desc = 'Config folder' })
		end
	},
}
