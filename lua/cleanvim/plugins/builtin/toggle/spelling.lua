local M = {}

local toggle_spelling = function()
    vim.wo.spell = not vim.wo.spell
    print("Spelling: " .. (vim.wo.spell and "on" or "off") .. "  (]s next, z= suggest, zg add)")
end

-- Grammar via harper-ls (an LSP); off by default since it also checks code comments
local toggle_grammar = function()
    if vim.fn.executable("harper-ls") == 0 then
        -- installed on first use; grammar turns on once it's ready
        return require("cleanvim.languages").mason_install({ "harper-ls" }, function()
            vim.lsp.enable("harper_ls")
            print("Grammar: on")
        end)
    end
    local enable = not vim.lsp.is_enabled("harper_ls")
    vim.lsp.enable("harper_ls", enable)
    print("Grammar: " .. (enable and "on" or "off"))
end

vim.keymap.set("n", "<leader>ts", toggle_spelling, { desc = "toggle spelling" })
vim.keymap.set("n", "<leader>tg", toggle_grammar, { desc = "toggle grammar" })

return M
