local M = {}

local float_mod = require("cleanvim.plugins.builtin.floatwindow")
local create_floating_window = float_mod.create_floating_window

local states = {
	plugins = { floating = { buf = -1, win = -1 } },
	themes  = { floating = { buf = -1, win = -1 } },
}

local any_state_open = function()
	for _, s in pairs(states) do
		if vim.api.nvim_win_is_valid(s.floating.win) then
			return true
		end
	end
	return false
end

local close_open_states = function()
	for _, s in pairs(states) do
		if s.floating.win and vim.api.nvim_win_is_valid(s.floating.win) then
		    vim.api.nvim_win_hide(s.floating.win)
			s.floating.win = -1
		end
	end
end

local add_stuff = function(opts, state)
    opts = opts or {}
    if not vim.api.nvim_win_is_valid(state.floating.win) then
		if any_state_open() then close_open_states() end
        state.floating = create_floating_window { buf = state.floating.buf }
        local ok, oil = pcall(require, "oil")
        if ok then
			local path = vim.fs.joinpath(unpack(opts.path))
            oil.open(vim.fs.joinpath(vim.fn.stdpath("config"), path))
            if opts.desc then print(opts.desc) end
        end
    else
		close_open_states()
	end
end

local add_plugin = function()
    add_stuff({
		path = { "lua", "cleanvim", "custom", "plugins" },
        desc = "Add custom plugins",
    }, states.plugins)
end

local add_theme = function()
    add_stuff({
		path = { "lua", "cleanvim", "plugins", "themes" },
        desc = "Add custom themes (filename must match theme name)",
    }, states.themes)
end

vim.api.nvim_create_user_command("AddPlugin", add_plugin, {})
vim.keymap.set("n", "<leader>ap", add_plugin, { desc = "Add plugin" })

vim.api.nvim_create_user_command("AddTheme", add_theme, {})
vim.keymap.set("n", "<leader>at", add_theme, { desc = "Add theme" })

local ok, wk = pcall(require, "which-key")
if ok and wk.add then
    wk.add({ { "<leader>a", group = "Add stuffs" } })
end

return M
