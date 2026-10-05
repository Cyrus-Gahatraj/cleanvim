local installed_formatters = require("cleanvim.plugins.lsp.installed.formatters")

return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = installed_formatters,
            -- checked on every save so <leader>tfs applies immediately
            format_on_save = function()
                if vim.g.format_on_save then
                    return { lsp_format = "fallback", timeout_ms = 500 }
                end
            end,
        })

        vim.keymap.set(
            "n",
            "<leader>cf",
            function()
                conform.format({
                    lsp_format = "fallback",
                    async = false,
                    timeout_ms = 500,
                })
            end,
            { desc = "Code format" }
        )
    end,
}
