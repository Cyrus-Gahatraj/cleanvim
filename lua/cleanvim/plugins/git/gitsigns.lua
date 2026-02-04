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
	end
}
