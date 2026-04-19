local M = {}
local themes = require("telescope.themes")
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local theme_map = {
    ["catppuccin"] = "catppuccin",
    ["catppuccin-latte"] = "catppuccin",
    ["cyberdream"] = "cyberdream",
    ["ethereal"] = "ethereal",
    ["everforest"] = "everforest",
    ["flexoki"] = "flexoki",
    ["gruvbox"] = "gruvbox",
    ["hackerman"] = "hackerman",
    ["kanagawa"] = "kanagawa",
    ["lumon"] = "lumon",
    ["matteblack"] = "matteblack",
    ["miasma"] = "miasma",
    ["monokai-pro"] = "monokai-pro",
    ["nord"] = "nordfox",
    ["osaka-jade"] = "bamboo",
    ["retro-82"] = "retro-82",
    ["ristretto"] = "monokai-pro",
    ["rose-pine"] = "rose-pine-moon",
    ["tokyonight"] = "tokyonight-night",
    ["vantablack"] = "vantablack",
    ["white"] = "white",
    ["bamboo"] = "bamboo",
}

local apply_theme = function()

    local save = require("cleanvim.plugins.builtin.save_state")
    local current_theme = vim.g.cleanvim_theme or "catppuccin"

    local set_theme = function(opts)
        opts = opts or {}
        local selection = action_state.get_selected_entry()
        if not selection then return end
        local theme_file = vim.fn.fnamemodify(selection[1], ":r")
        local colorscheme = theme_map[theme_file] or theme_file
        
        vim.g.cleanvim_theme = colorscheme
        local ok, err = pcall(vim.cmd, "colorscheme " .. colorscheme)
        if ok and opts.save then
            local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/theme.lua"
            save({
                path = path,
                return_state = string.format('return "%s"', colorscheme),
            })
        elseif not ok then
            pcall(vim.cmd, "colorscheme " .. current_theme)
            print("Error applying " .. colorscheme .. ": " .. (err or "unknown"))
        end
    end

    local next_color = function(bufnr)
        actions.move_selection_next(bufnr)
        set_theme()
    end

    local prev_color = function(bufnr)
        actions.move_selection_previous(bufnr)
        set_theme()
    end

	builtin.find_files(themes.get_dropdown({
		cwd = vim.fn.stdpath("config") .. "/lua/cleanvim/plugins/themes",
		attach_mappings = function(bufnr, map)

            map({ "i", "n" }, "<C-n>", next_color)
            map({ "i", "n" }, "<UP>", prev_color)
            map({ "i", "n" }, "<C-p>", prev_color)
            map({ "i", "n" }, "<DOWN>", next_color)

            actions.select_default:replace(function()
                set_theme({ save = true })
                actions.close(bufnr)
            end)
			return true
		end,
	}))
end


vim.keymap.set("n", "<leader>sth", function()
	apply_theme()
end, { desc = "Switch theme" })

return M