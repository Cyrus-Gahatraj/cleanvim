local deps = "cleanvim.plugins.lsp.dependencies."

return {
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
			}
		})
	end,
}
