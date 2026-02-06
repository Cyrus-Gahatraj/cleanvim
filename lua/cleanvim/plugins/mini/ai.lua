return {
	'nvim-mini/mini.ai', version = false,
	dependencies = { "folke/which-key.nvim" },
	config = function()
		require("mini.ai").setup({
			custom_textobjects = nil,

			mappings = {
				around = 'a',
				inside = 'i',

				around_next = 'an',
				inside_next = 'in',
				around_last = 'al',
				inside_last = 'il',

				goto_left = 'g[',
				goto_right = 'g]',
			},

			n_lines = 50,

			search_method = 'cover_or_next',

			silent = false,
		})

		-- Adding to Which-key
		local ok, wk = pcall(require, "which-key")

		if ok and wk.add then
			local ai_map = {
				mode = { "o", "v" },
			}

			local add_ai_group = function(prefix, name)
				return {
					{ prefix, group = name .. " textobject" },
					{ prefix .. "a", desc = name .. " argument" },
					{ prefix .. "b", desc = name .. " bracket" },
					{ prefix .. "c", desc = name .. " class" },
					{ prefix .. "d", desc = name .. " digit" },
					{ prefix .. "f", desc = name .. " function" },
					{ prefix .. "q", desc = name .. " quotes" },
					{ prefix .. "t", desc = name .. " tag" },
					{ prefix .. "?", desc = name .. " custom" },
				}
			end

			vim.list_extend(ai_map, add_ai_group("a", "around"))
			vim.list_extend(ai_map, add_ai_group("i", "inside"))
			vim.list_extend(ai_map, add_ai_group("an", "around next"))
			vim.list_extend(ai_map, add_ai_group("in", "inside next"))
			vim.list_extend(ai_map, add_ai_group("al", "around last"))
			vim.list_extend(ai_map, add_ai_group("il", "inside last"))

			wk.add(ai_map)
		end
	end
}
