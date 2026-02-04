local deps = "cleanvim.plugins.lsp.dependencies."

return {

	-- None-ls
	require("cleanvim.plugins.lsp.none-ls"),

	-- main LSP
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			require(deps .. "nvim-lspconfig"),
			require(deps .. "mason"),
		},
		config = function()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						vim.lsp.enable(server_name)
					end,
				},
			})
		end,
	},
}
