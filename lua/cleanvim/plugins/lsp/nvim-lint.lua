-- Installed Linter
local installed_linters = require("cleanvim.plugins.lsp.installed.linters")

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = installed_linters

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        local function do_lint()
            -- Get linters for current filetype
            local ft = vim.bo.filetype
            local names = lint.linters_by_ft[ft] or {}

            local valid_linters = {}
            for _, name in ipairs(names) do
                if vim.fn.executable(name) == 1 then
                    table.insert(valid_linters, name)
                end
            end

            if #valid_linters > 0 then
                lint.try_lint(valid_linters)
            else
                vim.diagnostic.show(nil, 0)
            end
        end

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                do_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", do_lint, { desc = "Run linter" })
    end,
}
