return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    version = "1.*",
    opts = {
        keymap = {
            preset = "default",
        },
        -- mini.cmdline owns the cmdline: <Tab> completes, <C-y> accepts
        cmdline = { enabled = false },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            documentation = {
                auto_show = false,
            },
            menu = {
                border = "rounded",
            },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
