local formatter = {
	lua = { "stylua" },
	rust = { "rustfmt" },
	c = { "clang-format" },
	python = { "isort", "black" },
	javascript = { "prettierd" },
	typescript = { "prettierd" },
	go = { "gofumpt" },
	sh = { "shfmt" },
}

return formatter
