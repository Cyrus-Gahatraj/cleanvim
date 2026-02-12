local M = {}
local themes = require("telescope.themes")
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local save = require("cleanvim.plugins.builtin.save_state")

local apply_theme = function()
    local current_theme = vim.g.cleanvim_theme

    local set_theme = function(opts)
        opts = opts or {}
        local selection = action_state.get_selected_entry()
        if not selection then return end
        local theme_name = vim.fn.fnamemodify(selection[1], ":r")
        local ok, err = pcall(vim.cmd, "colorscheme " .. theme_name)
        if ok and opts.save then
            local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/theme.lua"
            save({
                path = path,
                return_state = string.format('return "%s"', theme_name),
            })
        elseif not ok then
            pcall(vim.cmd, "colorscheme " .. current_theme)
            print("Error: " .. err)
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
