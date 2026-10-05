local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

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
                require("cleanvim.config.state").set("view_diagnostic", diagnostic)
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
