return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts  = {
		preset = "helix",
		plugins = {
			presets = {
				motions = false,
				text_objects = false
			},
		}
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		local plugins_map = require("cleanvim.plugins.wk.wk_maps")
		plugins_map.setup()
	end
}
