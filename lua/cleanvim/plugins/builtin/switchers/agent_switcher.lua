local M = {}

-- Known agent CLIs; only the installed ones are listed. Any other: :Agent <cmd>
local agents = { "claude", "codex", "gemini", "opencode", "aider", "cursor-agent", "amp" }

local apply_agent = function(opts)
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    pickers
        .new({
            prompt_title = "Agent (current: " .. vim.g.cleanvim_agent .. ")",
            finder = finders.new_table({
                results = vim.tbl_filter(
                    function(a) return vim.fn.executable(a) == 1 end,
                    agents
                ),
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(bufnr, _)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    actions.close(bufnr)
                    if not selection then return end
                    vim.cmd.Agent(selection[1])
                end)
                return true
            end,
        })
        :find()
end

vim.keymap.set("n", "<leader>sa", function() apply_agent() end, { desc = "Switch agent" })

return M
