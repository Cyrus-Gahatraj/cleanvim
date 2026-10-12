local M = {}

local languages = require("cleanvim.languages")

local toggle_languages = function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local finder = function()
        local enabled = languages.enabled()
        return finders.new_table({
            results = languages.all(),
            entry_maker = function(name)
                local mark = vim.list_contains(enabled, name) and "● " or "○ "
                return { value = name, display = mark .. name, ordinal = name }
            end,
        })
    end

    pickers
        .new(require("telescope.themes").get_dropdown(), {
            prompt_title = "Languages (enter toggles)",
            finder = finder(),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(bufnr)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    if not selection then return end
                    local on = languages.toggle(selection.value)
                    vim.notify(selection.value .. (on and " on" or " off"))
                    -- stay open so several languages can be toggled in one go
                    action_state
                        .get_current_picker(bufnr)
                        :refresh(finder(), { reset_prompt = false })
                end)
                return true
            end,
        })
        :find()
end

vim.keymap.set("n", "<leader>tl", toggle_languages, { desc = "toggle languages" })

return M
