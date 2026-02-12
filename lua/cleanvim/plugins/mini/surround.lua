return {
	'nvim-mini/mini.surround',
	version = false,
    event = "VeryLazy",
	dependencies = { "folke/which-key.nvim" },
	config = function()
		require("mini.surround").setup({
			custom_surroundings = nil,
			highlight_duration = 500,

			mappings = {
				add = 'sa', -- add surrounding in normal and visual modes
				delete = 'sd', -- delete surrounding
				find = 'sf', -- find surrounding (to the right)
				find_left = 'sf', -- find surrounding (to the left)
				highlight = 'sh', -- highlight surrounding
				replace = 'sr', -- replace surrounding

				suffix_last = 'l', -- suffix to search with "prev" method
				suffix_next = 'n', -- suffix to search with "next" method
			},

			-- number of lines within which surrounding is searched
			n_lines = 20,

			respect_selection_type = false,

			search_method = 'cover',

			silent = false,
		})
	end
}

