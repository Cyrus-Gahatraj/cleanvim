-- Floating terminal running a coding agent CLI (claude, codex, ...).
-- <Esc> is left alone because agents use it to interrupt; hide with <C-q>.
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
        vim.bo[buf].buflisted = false
        vim.bo[buf].bufhidden = "hide"
        vim.keymap.set("t", "<C-q>", fm.close_all, { buffer = buf, desc = "Hide agent" })
        -- agent quit: drop the float and buffer so the next toggle starts fresh
        vim.api.nvim_create_autocmd("TermClose", {
            buffer = buf,
            once = true,
            callback = vim.schedule_wrap(function()
                fm.close_all()
                pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end),
        })
    end
    vim.cmd.startinsert()
end

local toggle_agent = function() fm.toggle(agent, open) end

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
vim.keymap.set("n", "<leader>tA", send_ref, { desc = "Send file to agent" })
vim.keymap.set("x", "<leader>ta", send_ref, { desc = "Send selection to agent" })

return M
