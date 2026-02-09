local installed_linters = require("cleanvim.plugins.lsp.installed.linters")

return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = installed_linters
	end,
}
