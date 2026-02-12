local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local save = require("cleanvim.plugins.builtin.save_state")

local apply_diagnostic = function(opts)
    pickers.new({
        finder = finders.new_table {
            results = { "text-and-sign", "only-text", "only-sign", "none" }
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(bufnr, _)
            actions.select_default:replace(function()
                actions.close(bufnr)
                local selection = action_state.get_selected_entry()
                local diagnostic = selection[1]
                local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/view_diagnostic.lua"
                save({
                    path = path,
                    return_state = string.format('return "%s"', diagnostic),
                })
                print("Require a restart")
            end)
            return true
        end,
    }):find()
end

vim.keymap.set("n", "<leader>sd", function()
	apply_diagnostic()
end, { desc = "Switch diagnostic style" })


return M
