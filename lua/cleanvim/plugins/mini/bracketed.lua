return {
	'nvim-mini/mini.bracketed', version = false,
    event = "VeryLazy",
	config = function()
		require("mini.bracketed").setup()
	end
}
