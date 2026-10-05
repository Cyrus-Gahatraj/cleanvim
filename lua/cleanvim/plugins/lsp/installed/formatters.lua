-- Missing formatters fall back to the LSP (e.g. rustfmt/gofumpt -> rust-analyzer/gopls)
local formatter = {
    lua = { "stylua" },
    rust = { "rustfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "isort", "black" },
    go = { "gofumpt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    toml = { "taplo" },

    -- prettierd covers all of these with one install
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    css = { "prettierd" },
    scss = { "prettierd" },
    html = { "prettierd" },
}

return formatter
