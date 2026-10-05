return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- language servers (light ones; add more with :Mason)
                "lua-language-server",
                "bash-language-server",
                "json-lsp",
                "yaml-language-server",
                "taplo",
                "pyright",
                "typescript-language-server",
                "marksman",

                -- formatters / linters
                "stylua",
                "selene",
                "clang-format",
                "prettierd",
                "eslint_d",
                "black",
                "isort",
                "shfmt",
                "shellcheck",
                "typos",
            },
            auto_update = true,
            run_on_start = true,
        })
    end,
}
