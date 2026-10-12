local M = {}

local create_floating_window =
    require("cleanvim.plugins.builtin.floatwindow").create_floating_window

local fm = require("cleanvim.plugins.builtin.floatmanager")

local plugins = fm.register("plugins")
local themes = fm.register("themes")
local language = fm.register("language")
local snippet = fm.register("snippet")

local add_stuff = function(opts, state)
    fm.toggle(state, function()
        state.floating = create_floating_window({
            buf = state.floating.buf,
            minimal = false,
        })

        local ok, oil = pcall(require, "oil")
        if ok then
            local path = vim.fs.joinpath(unpack(opts.path))
            oil.open(vim.fs.joinpath(vim.fn.stdpath("config"), path))
            if opts.desc then print(opts.desc) end
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

local add_language = function()
    add_stuff({
        path = { "lua", "cleanvim", "languages" },
        desc = "Add a language: copy a file, then enable it with <leader>tl",
    }, language)
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

vim.api.nvim_create_user_command("AddLanguage", add_language, {})
vim.keymap.set("n", "<leader>al", add_language, { desc = "Add language" })

vim.api.nvim_create_user_command("AddSnippet", add_snippet, {})
vim.keymap.set("n", "<leader>as", add_snippet, { desc = "Add snippet" })

return M
