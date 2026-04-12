local M = {}

local create_floating_window = require(
	"cleanvim.plugins.builtin.floatwindow"
).create_floating_window

local fm = require("cleanvim.plugins.builtin.floatmanager")

local plugins = fm.register("plugins")
local themes = fm.register("themes")
local formatter = fm.register("formatter")
local linter = fm.register("linter")
local snippet = fm.register("snippet")

local add_stuff = function(opts, state)
	fm.toggle(state, function()
		state.floating = create_floating_window({
			buf = state.floating.buf,
		})

		local ok, oil = pcall(require, "oil")
		if ok then
			local path = vim.fs.joinpath(unpack(opts.path))
			oil.open(vim.fs.joinpath(vim.fn.stdpath("config"), path))
			if opts.desc then
				print(opts.desc)
			end
		end
	end)
end


local add_plugin = function()
	add_stuff({
		path = { "lua", "cleanvim", "plugins", "custom" },
		desc = "Add custom plugins",
	}, plugins)
end

local add_theme = function()
	add_stuff({
		path = { "lua", "cleanvim", "plugins", "themes" },
		desc = "Add custom themes (filename must match theme name)",
	}, themes)
end

local add_formatter = function()
	add_stuff({
		path = { "lua", "cleanvim", "plugins", "lsp", "installed", "formatters.lua" },
		desc = "Add formatter",
	}, formatter)
end

local add_linter = function()
	add_stuff({
		path = { "lua", "cleanvim", "plugins", "lsp", "installed", "linters.lua" },
		desc = "Add linters",
	}, linter)
end

local add_snippet = function()
	add_stuff({
		path = { "snippets" },
		desc = "Add snippets",
	}, snippet)
end

vim.api.nvim_create_user_command("AddPlugin", add_plugin, {})
vim.keymap.set("n", "<leader>ap", add_plugin, { desc = "Add plugin" })

vim.api.nvim_create_user_command("AddTheme", add_theme, {})
vim.keymap.set("n", "<leader>at", add_theme, { desc = "Add theme" })

vim.api.nvim_create_user_command("AddFormatter", add_formatter, {})
vim.keymap.set("n", "<leader>af", add_formatter, { desc = "Add formatter" })

vim.api.nvim_create_user_command("AddLinter", add_linter, {})
vim.keymap.set("n", "<leader>al", add_linter, { desc = "Add linter" })

vim.api.nvim_create_user_command("AddSnippet", add_snippet, {})
vim.keymap.set("n", "<leader>as", add_snippet, { desc = "Add snippet" })

return M
