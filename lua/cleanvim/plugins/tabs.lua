return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				separator_style = "thin",
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				show_tab_indicators = false,
				offsets = {
					{
						filetype = "oil",
						text = "Oil",
						highlight = "Directory",
						separator = false,
					},
				}

			},
			highlights = {
				fill = {
					bg = "none",
				},
				buffer_selected = {
					bold = true,
					italic = false,
				},
			},
		})

	end
}
