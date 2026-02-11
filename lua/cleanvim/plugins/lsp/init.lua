local deps = "cleanvim.plugins.lsp.deps."

return {
	-- nvim-lint
	require("cleanvim.plugins.lsp.nvim-lint"),

	-- conform
	require("cleanvim.plugins.lsp.conform"),

	-- main LSP
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			require(deps .. "nvim-lspconfig"),
			require(deps .. "mason"),
			require(deps .. "mason-tool-installer"),
		},
		config = function()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						vim.lsp.enable(server_name)
					end,
				},
			})
            require("cleanvim.plugins.lsp.keymaps")
		end,
	},
}
