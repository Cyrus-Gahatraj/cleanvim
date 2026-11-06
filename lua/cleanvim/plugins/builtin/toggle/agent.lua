-- Floating terminal running a coding agent CLI (claude, codex, ...).
-- <Esc> is left alone because agents use it to interrupt (<C-[> is the same key).
-- <C-]> drops to normal mode, <C-q> / q hides. Several sessions can run at once.
local M = {}

local create_floating_window =
    require("cleanvim.plugins.builtin.floatwindow").create_floating_window

local fm = require("cleanvim.plugins.builtin.floatmanager")
local agent = fm.register("agent")

local open = function(state)
    state.floating = create_floating_window({ buf = state.floating.buf })
    local buf = state.floating.buf
    if vim.bo[buf].buftype ~= "terminal" then
        vim.fn.jobstart(vim.g.cleanvim_agent, { term = true })
        vim.b[buf].cleanvim_agent = vim.g.cleanvim_agent
        vim.bo[buf].buflisted = false
        vim.bo[buf].bufhidden = "hide"
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end
        map("t", "<C-]>", "<C-\\><C-n>", "Agent: normal mode")
        map({ "t", "n" }, "<C-q>", fm.close_all, "Hide agent")
        map("n", "q", fm.close_all, "Hide agent")
        -- agent quit: drop the float and buffer so the next toggle starts fresh
        vim.api.nvim_create_autocmd("TermClose", {
            buffer = buf,
            once = true,
            callback = vim.schedule_wrap(function()
                if agent.floating.buf == buf then fm.close_all() end
                pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end),
        })
    end
    vim.cmd.startinsert()
end

local toggle_agent = function() fm.toggle(agent, open) end

-- Pick a running agent session (or start a new one) and show it in the float
local switch_session = function()
    local sessions = vim.tbl_filter(
        function(b) return vim.b[b].cleanvim_agent ~= nil end,
        vim.api.nvim_list_bufs()
    )
    local items = vim.tbl_map(function(b)
        return { buf = b, label = ("%d: %s"):format(b, vim.b[b].cleanvim_agent) }
    end, sessions)
    table.insert(items, { buf = -1, label = "+ new session (" .. vim.g.cleanvim_agent .. ")" })

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    pickers
        .new({}, {
            prompt_title = "Agent sessions",
            finder = finders.new_table({
                results = items,
                entry_maker = function(i) return { value = i, display = i.label, ordinal = i.label } end,
            }),
            sorter = require("telescope.config").values.generic_sorter({}),
            attach_mappings = function(bufnr)
                actions.select_default:replace(function()
                    local sel = action_state.get_selected_entry()
                    actions.close(bufnr)
                    if not sel then return end
                    fm.close_all()
                    agent.floating.buf = sel.value.buf
                    vim.schedule(toggle_agent)
                end)
                return true
            end,
        })
        :find()
end

-- Send "@file" (or "@file#Lx-y" from visual mode) to the agent prompt
local send_ref = function()
    local ref = "@" .. vim.fn.expand("%:.")
    if vim.fn.mode():match("[vV\22]") then
        local s, e = vim.fn.line("v"), vim.fn.line(".")
        if s > e then
            s, e = e, s
        end
        ref = ref .. ("#L%d-%d"):format(s, e)
        vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "nx", false)
    end
    if not vim.api.nvim_win_is_valid(agent.floating.win) then toggle_agent() end
    vim.api.nvim_chan_send(vim.bo[agent.floating.buf].channel, ref .. " ")
end

vim.api.nvim_create_user_command("Agent", function(opts)
    if opts.args == "" then return toggle_agent() end
    vim.g.cleanvim_agent = opts.args
    require("cleanvim.config.state").set("agent", opts.args)
    -- stop the running agent; TermClose cleans up, next toggle uses the new command
    local buf = agent.floating.buf
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].channel > 0 then
        vim.fn.jobstop(vim.bo[buf].channel)
    end
    vim.notify("Cleanvim: agent set to " .. opts.args)
end, { nargs = "?", desc = "Toggle agent, or :Agent <cmd> to switch it" })

vim.keymap.set("n", "<leader>ta", toggle_agent, { desc = "Toggle agent" })
vim.keymap.set("n", "<leader>ss", switch_session, { desc = "Switch agent session" })
vim.keymap.set("n", "<leader>tA", send_ref, { desc = "Send file to agent" })
vim.keymap.set("x", "<leader>ta", send_ref, { desc = "Send selection to agent" })

return M
