local deps = "cleanvim.plugins.lsp.deps."

return {
    -- nvim-lint
    require("cleanvim.plugins.lsp.nvim-lint"),

    -- conform
    require("cleanvim.plugins.lsp.conform"),

    -- main LSP
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            require(deps .. "nvim-lspconfig"),
            require(deps .. "mason"),
            require(deps .. "fidget"),
        },
        config = function()
            -- v2 auto-enables installed servers via vim.lsp.enable;
            -- harper_ls (grammar) stays off until <leader>tg
            require("mason-lspconfig").setup({
                automatic_enable = { exclude = { "harper_ls" } },
            })
        end,
    },
}
