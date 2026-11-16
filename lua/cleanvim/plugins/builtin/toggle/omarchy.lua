local M = {}

-- Drops back to the theme saved inside cleanvim when the sync is off
local apply_saved = function()
    local colorscheme = require("cleanvim.config.state").load().theme
    colorscheme = require("cleanvim.ui.theme").colorscheme_for(colorscheme)

    vim.g.cleanvim_theme = colorscheme
    pcall(vim.cmd.colorscheme, colorscheme)
end

local toggle_omarchy = function()
    local omarchy = require("cleanvim.omarchy")
    if not omarchy.name() then return print("Not running under Omarchy") end

    local state = require("cleanvim.config.state")
    local sync = not state.load().omarchy_sync
    state.set("omarchy_sync", sync)

    if sync then
        omarchy.start()
    else
        apply_saved()
    end
    print("Omarchy theme sync: " .. (sync and "on" or "off"))
end

vim.keymap.set("n", "<leader>to", toggle_omarchy, { desc = "toggle omarchy theme sync" })

return M
