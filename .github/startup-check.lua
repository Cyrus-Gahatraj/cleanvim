-- CI: after startup has settled, fail if anything reported an error
vim.defer_fn(function()
    local msgs = vim.api.nvim_exec2("messages", { output = true }).output
    io.stdout:write(msgs .. "\n" .. vim.v.errmsg .. "\n")
    local failed = vim.v.errmsg ~= "" or msgs:find("Error") or msgs:find("E%d+:")
    vim.cmd(failed and "cquit 1" or "qall!")
end, 5000)
