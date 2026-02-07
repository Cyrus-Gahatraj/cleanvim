return {
	'nvim-mini/mini.surround',
	version = false,
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

		local ok, wk = pcall(require, "which-key")
		if ok and wk.add then
			local sr_map = {
				mode = { "n", "v" },
			}

			local add_sr_suffix = function(suffix, name)
				return {
					{ "s" .. suffix, group = "surround " .. name },
					{ "s" .. suffix .. "a", desc = "add " .. name .. " surround" },
					{ "s" .. suffix .. "d", desc = "delete " .. name .. " surround" },
					{ "s" .. suffix .. "r", desc = "replace " .. name .. " surround" },
					{ "s" .. suffix .. "f", desc = "find " .. name .. " surround right" },
					{ "s" .. suffix .. "F", desc = "find " .. name .. " surround left" },
					{ "s" .. suffix .. "h", desc = "highlight " .. name .. " surround" },
				}
			end

			vim.list_extend(sr_map, add_sr_suffix("", ""))
			vim.list_extend(sr_map, add_sr_suffix("n", "next"))
			vim.list_extend(sr_map, add_sr_suffix("l", "last"))

			wk.add(sr_map)
		end
	end
}

