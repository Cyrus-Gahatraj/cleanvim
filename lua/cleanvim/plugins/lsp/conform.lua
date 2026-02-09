local format_on_save = function(opts)
	opts.setup({
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
	})
end

return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				python = { "isort", "black" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				go = { "gofumpt" },
				sh = { "shfmt" },
			},
		})

		if vim.g.format_on_save then
			format_on_save(conform)
		end

		vim.keymap.set("n", "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Code format" })
	end,
}
