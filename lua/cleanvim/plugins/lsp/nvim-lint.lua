return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			lua = { "selene" },
			python = { "pylint" },
			javascript = { "eslint_d" },
			sh = { "shellcheck" },
		}
	end,
}
