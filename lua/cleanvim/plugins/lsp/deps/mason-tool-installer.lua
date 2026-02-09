return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				ensure_installed = {
					"stylua",
					"selene",
					"rustfmt",
					"clang-format",
					"prettierd",
					"eslint_d",
					"black",
					"isort",
					"shfmt",
					"shellcheck",
					"marksman",
					"typos",
				},
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
